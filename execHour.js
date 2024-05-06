
const moment = require('moment');
const schedule = require('node-schedule');
const fs = require('fs-extra');
const sharp = require('sharp');

const log = require('./utils/console');
const readFile = require('./readFile');
const readImage = require('./readImage');

const dbHost = '127.0.0.1';
const dbPort = 7776;
const dbUser = 'admin';
const dbPassword = 'admin';
const dbName = 'postgres';

const { Client } = require('pg');

const client = new Client({
    user: dbUser,
    password: dbPassword,
    host: dbHost,
    port: dbPort,
    database: dbName,
});

const myLog = (msg) => {

    const myFileMsg = `${moment().format('YYYY-MM-DD HH:mm:ss')} => ${msg}`;

    const fs = require('fs');
    //msg= `${msg}`;
    log(myFileMsg);

    fs.appendFile(`./log/${moment().format('YYYY-MM-DD')}.txt`, myFileMsg + '\r\n', function (err) {
        if (err) {
            log(err);
            return;
        }
    });

}

const getFiles = (dir, files = []) => {
    // Get an array of all files and directories in the passed directory using fs.readdirSync

    if (fs.existsSync(dir)) {
        const fileList = fs.readdirSync(dir)
        // Create the full path of the file/directory by concatenating the passed directory and file/directory name
        for (const file of fileList) {
            const name = `${dir}/${file}`
            // Check if the current file/directory is a directory using fs.statSync
            if (fs.statSync(name).isDirectory()) {
                // If it is a directory, recursively call the getFiles function with the directory path and the files array
                getFiles(name, files)
            } else {
                // If it is a file, push the full path to the files array
                files.push(name)
            }
        }

        return files

    } else {
        log(`--- ${dir} is empty ---`);
        return [];
    }

}

const myQuery1 = (mySqlStr) => {
    return new Promise((resolve, reject) => {
        client.query(
            `${mySqlStr}`,
            (err, rows, fields) => {
                //console.log(rows);
                if (err) reject(err);
                else resolve(rows);
            }
        );
    });
};

const myQuery2 = (fk_panelid) => {
    return new Promise((resolve, reject) => {
        client.query(
            `    
            SELECT pk_imgid FROM xml_image
            WHERE fk_panelid = $1
            `
            ,[fk_panelid],
            (err, rows, fields) => {
                if (err) reject(err);
                else resolve(rows);
            }
        );
    });
};

const myQuery3 = j => {
    return new Promise((resolve, reject) => {
        client.query(
            `select picpath,x1,y1,x2,y2 from xml_image where pk_imgid=$1`,[j],
            (err, rows, fields) => {
                //console.log(rows);
                if (err) reject(err);
                else resolve(rows);
            }
        );
    });
};

const myQuery4 = (j, myBlob,code) => {
    return new Promise((resolve, reject) => {
        client.query(
            `    
            INSERT INTO xml_picture
                (fk_imgid, cropimage, code)
            VALUES
                ($1, $2, $3)
            ON CONFLICT (fk_imgid)
            DO UPDATE SET cropimage = $2;
            
            `
            ,[j,myBlob,code],
            (err, rows, fields) => {
                if (err) reject(err);
                else resolve(rows);
            }
        );
    });
};

const myQuery5 = (j,lightCode) => {
    return new Promise((resolve, reject) => {
        client.query(
            `    
            UPDATe xml_image set fk_sourceid=$2 where pk_imgid=$1;
            `
            ,[j,lightCode],
            (err, rows, fields) => {
                if (err) reject(err);
                else resolve(rows);
            }
        );
    });
};

async function main() {

    try {
        myLog('--- Start ---');
        await client.connect();

        const job = schedule.scheduleJob('20 * * * *', async function(){
       
            const theHour=moment().subtract(1,'h').format('YYYYMMDDHH');
            const theDay=theHour.substring(0,8);

    
            myLog(`(1) Start to process [${theHour}]`);
            const filesInTheFolder = getFiles(`/home/innodisk/share/XML/${theDay}/TRI-MainPC-D`);
    
            const filesForProcess=[]; 
            filesInTheFolder.forEach((item) => {
                if (item.indexOf(theHour)>=0){
                    filesForProcess.push(item);
                }
            });
           
            for (let i = 0; i < filesForProcess.length; i++) {

                myLog(`---------- Progress : ${((i+1)/filesForProcess.length*100).toFixed(2)}% (${i+1}/${filesForProcess.length}) ----------`)

                myLog(`file : ${filesForProcess[i]}`);

                /* (1) Process Data Import */
                myLog('(1) Process Data Import')
                const sqlStr = await readFile(filesForProcess[i]);
                //myLog('sql===>'+sqlStr)
                const mySave = await myQuery1(sqlStr);
                const pk_panelid = mySave[1].rows[0].insert_file_data;

                myLog(`pk_panelid : ${pk_panelid} `)


                /* (2) Process Image Import */
                myLog('(2) Process Image Import')
                if (pk_panelid) {
                    
                    //readImage(pk_panelid,client);
                    const myData= await myQuery2(pk_panelid);
                    const myRow1 = myData.rows;
                    if (myRow1.length > 0) {
            
                        for (let i = 0; i < myRow1.length; i++) {
                            const pk_imgid = myRow1[i].pk_imgid;
                            //myLog(pk_imgid);
                            const myData2=await myQuery3(pk_imgid);
                            const myRow2 = myData2.rows;
            
                            if (myRow2.length > 0) {
                                const PicPath = myRow2[0].picpath;
                                //myLog(PicPath);
                                if (PicPath) {
            
                                    const X1 = myRow2[0].x1;
                                    const Y1 = myRow2[0].y1;
                                    const X2 = myRow2[0].x2;
                                    const Y2 = myRow2[0].y2;
                                    const myPath = PicPath.replace("\\\\Yl1-smtaoi-nas\\aoi_ai", "\\home\\innodisk\\share");
                
                                    const regex = /\\/g;
                                    const PicPathNew = myPath.replace(regex, "/");


                                    let theCode=0;

                                    if (PicPath){
                                        if (PicPath.indexOf("SolderLight")>=0){
                                            theCode=1; 
                                        }
                                        else if (PicPath.indexOf("UniformLight")>=0){
                                            theCode=2; 
                                        }
                                        else if (PicPath.indexOf("LowAngleLight")>=0){
                                            theCode=3; 
                                        }
                                        else if (PicPath.indexOf("WhiteLight")>=0){
                                            theCode=4;
                                        }
                                        else{
                                            theCode=0;
                                        }
                                    }else{
                                        theCode=-1;
                                    }
                                        
                
                                    if (fs.existsSync(PicPathNew)) {
                                                                           
                                        if ((X1) && (Y1) && (Y2) && (Y2)) {
                
                                            try {
                                                // 有座標,截圖存檔
                                                const outputBuffer = await sharp(PicPathNew).extract({ left: X1, top: Y1, width: (X2 - X1), height: (Y2 - Y1) }).toBuffer();
                                                const mySave1 = await myQuery4(pk_imgid, outputBuffer,0);
                                                const mySave2 = await myQuery5(pk_imgid,theCode);
                                                myLog(`Insert image : ${pk_imgid} success `)
                                                                        
                                            } catch (error) {
                
                                                // 有座標,截圖存檔,但圖片損毀
                                                if (error.message.indexOf("Premature end of input file") >= 0) {
                                                    myLog('file corrupt')
                                                    const outputBuffer=await sharp('./assets/FileCorrupt.jpg').toBuffer();
                                                    const mySave1 = await myQuery4(pk_imgid, outputBuffer,1); 
                                                    const mySave2 = await myQuery5(pk_imgid,theCode);
                                                    myLog(`Insert image : ${pk_imgid} success `)
                                                  
                                                }else{
                                                    myLog('unknow error');
                                                    console.log(error)
                                                }
                                            }
                                            
                                        } else {
                                           
                                            // 無座標,放原圖
                                            try {
                                                const outputBuffer = await sharp(PicPathNew).toBuffer();
                                                const mySave1 = await myQuery4(pk_imgid, outputBuffer,2);
                                                const mySave2 = await myQuery5(pk_imgid,theCode);
                                                myLog(`Insert image : ${pk_imgid} success `)
                                                
                                            } catch (error) {
                
                                                // 無座標,放原圖,但圖片損毀
                                                if (error.message.indexOf("Premature end of input file") >= 0) {
                                                    log('file corrupt 2')
                                                    const outputBuffer=await sharp('./assets/FileCorrupt.jpg').toBuffer();
                                                    const mySave1 = await myQuery4(pk_imgid, outputBuffer,3);
                                                    const mySave2 = await myQuery5(pk_imgid,theCode);
                                                    log(`Insert image : ${pk_imgid} success `)
                                                
                                                }
                                            }
                                        }
                                    }else{
            
                                        myLog('file not exist')
                                        const outputBuffer = await sharp('./assets/FileNotFound.jpg').toBuffer();            
                                        const mySave1 = await myQuery4(pk_imgid, outputBuffer,4);
                                        const mySave2 = await myQuery5(pk_imgid,theCode);
                                        myLog(`Insert image : ${pk_imgid} success `)
                                                
                                                      
                                    }
                
                                }
                            }
                       
                        }
                    }


                }
               
              
                /* (3) Process AI Result Import */
                myLog('(3) Process AI Result Import')
                const filepath=filesForProcess[i];
                const filename='/home/innodisk/share/Runtime/igrafana/'+filepath.substr(filepath.lastIndexOf("/")+1).replace(".xml",".json");
                if (fs.existsSync(filename)){
                    
                    const data = JSON.parse(fs.readFileSync(filename, 'utf8'));
                    const compArr=data.components;
                    for (let l = 0; l < (compArr.length); l++) {

                        const ai_result_comp=compArr[l].ai_result;
                        const compname=compArr[l].component_name;
                        const partno=compArr[l].part_no;

                        const mySqlStr1=`update xml_component set ai_result='${ai_result_comp}' where fk_panelid=${pk_panelid} and ${(partno==='')?'partno is null':`partno='${partno}'`} and compname='${compname}';`
                        const myResult1 = await myQuery1(mySqlStr1);
                        myLog(mySqlStr1)

                        const detailsArr=compArr[l].details;

                        for (let m = 0; m < (detailsArr.length); m++) {

                            const picpath=detailsArr[m].image_path;
                            const picname=picpath.substr(picpath.lastIndexOf("/")+1)
                            const ai_result_image=detailsArr[m].ai_result;
                            const ai_confidence=detailsArr[m].confidence_score;
                            const ai_threshold=detailsArr[m].confidence_threshold;
                            const ai_errorcode=detailsArr[m].error_code;

                            //const mySqlStr2=`select count(*) from xml_image where fk_panelid=${pk_panelid} and picpath like '%${picname}%';`
                            const mySqlStr2=`update xml_image set ai_result='${ai_result_image}',ai_confidence=${ai_confidence},ai_threshold=${ai_threshold},ai_errorcode=${ai_errorcode}  where fk_panelid=${pk_panelid} and picpath like '%${picname}%';`
                            const myResult2 = await myQuery1(mySqlStr2);
                            myLog(mySqlStr2)
                            //console.log(myResult.rows[0])

                        }
                    }

                    // move file to local for temperture storage
                    if (!fs.existsSync(`./json/${theDay}`)){
                        fs.mkdirSync(`./json/${theDay}`);
                    } 


                    const shortFileName=filename.substr(filename.lastIndexOf("/")+1);
                    myLog(`shortFileName=${shortFileName}`)
                    fs.moveSync(filename, `./json/${theDay}/${shortFileName}`, function (err) {
                        if (err) return console.log(err)
                        
                    });

                }
            }

           
           
    
        });
    }catch(e){
        myLog(e.msg);
        client.end();
    }

}

main();