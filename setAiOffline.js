
const moment =require('moment');


const readFile = require('./readFile');
const log = require('./utils/console');
const fs = require('fs-extra');
//const dbHost = '172.16.93.100';

const dbHost = '127.0.0.1';
const dbPort = 7776;
const dbUser = 'admin';
const dbPassword = 'admin';
const dbName = 'postgres';

const sDate = '2024-04-26';
const eDate = '2024-04-26';



// Recursive function to get files
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

const getFile = (filename) => {
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

const { Client } = require('pg');

const client = new Client({
    user: dbUser,
    password: dbPassword,
    host: dbHost,
    port: dbPort,
    database: dbName,
});


async function main() {

    

    const myQuery1 = (myFromDate,myToDate) => {
        const mySqlStr=`SELECT A.pk_panelid,A.filename,A.fdate FROM public.xml_panel A
        where A.fdate>='${myFromDate}' and A.fdate<'${myToDate}'
        ORDER BY pk_panelid`;
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

    const myQuery2 = (mySqlStr) => {
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

    client.connect()
        .then(async function() {

            myLog("database are connected!");
            const interval = moment(eDate).diff(moment(sDate), 'days');

            myLog('interval')
            myLog(interval)

            let counter=0;

            for (let j = 0; j < (interval + 1); j++) {
                const theFromDate = moment(sDate).add(j, 'days').format('YYYY-MM-DD HH:mm:ss');
                const theToDate = moment(sDate).add(j+1, 'days').format('YYYY-MM-DD HH:mm:ss');

            
                const myData = await myQuery1(theFromDate,theToDate);
    

                for (let k = 0; k < (myData.rows.length); k++) {

                    //if (k>10) return;

                    const pk_panelid=myData.rows[k].pk_panelid;
                    const filepath=myData.rows[k].filename;
                    //const filename='/home/innodisk/share/Runtime/igrafana/0426/'+filepath.substr(filepath.lastIndexOf("/")+1).replace(".xml",".json");
                    const filename='./json_offline/20240426/'+filepath.substr(filepath.lastIndexOf("/")+1).replace(".xml",".json");
                    const fdate=myData.rows[k].fdate;
                    const theDay=moment(fdate).format('YYYYMMDD');

                  
                    
        
                    if (fs.existsSync(filename)){
                        myLog('pk_panelid')
                        myLog(pk_panelid)
                        //const data = await readFile(filename);

                        const data = JSON.parse(fs.readFileSync(filename, 'utf8'));
                        const compArr=data.components;

                        for (let l = 0; l < (compArr.length); l++) {

                            //console.log(compArr[l])
                            const ai_result_comp=compArr[l].ai_result;
                            const compname=compArr[l].component_name;
                            const partno=compArr[l].part_no;

                            //const mySqlStr1=`select count(*) from xml_component where fk_panelid=${pk_panelid} and partno='${partno}' and compname='${compname}';`
                            const mySqlStr1=`update xml_component set ai_result='${ai_result_comp}' where fk_panelid=${pk_panelid} and ${(partno==='')?'partno is null':`partno='${partno}'`} and compname='${compname}';`
                            const myResult1 = await myQuery2(mySqlStr1);
                            myLog(`==================== ${counter} =======================`)
                            myLog(mySqlStr1)

                            const detailsArr=compArr[l].details;

                            for (let m = 0; m < (detailsArr.length); m++) {


                                counter++;

                                const picpath=detailsArr[m].image_path;
                                const picname=picpath.substr(picpath.lastIndexOf("/")+1)
                                const ai_result_image=(detailsArr[m].ai_result==='null')?'None':detailsArr[m].ai_result;
                                const ai_confidence=detailsArr[m].confidence_score;
                                const ai_threshold=detailsArr[m].confidence_threshold;
                                const ai_errorcode=detailsArr[m].error_code;

                                //const mySqlStr2=`select count(*) from xml_image where fk_panelid=${pk_panelid} and picpath like '%${picname}%';`
                                const mySqlStr2=`update xml_image set ai_result='${ai_result_image}',ai_confidence=${ai_confidence},ai_threshold=${ai_threshold},ai_errorcode=${ai_errorcode}  where fk_panelid=${pk_panelid} and picpath like '%${picname}%';`
                                const myResult2 = await myQuery2(mySqlStr2);
                                myLog(`----- ${counter} : ${m} -----`)
                                myLog(mySqlStr2)
                                //console.log(myResult.rows[0])

                            }



                            //console.log(mySqlStr)
                            //const myResult = await myQuery2(mySqlStr);

                            //console.log(myResult.rows[0])

                        }

                        // move file to local for temperture storage
                        // if (!fs.existsSync(`./json_offline/${theDay}`)){
                        //     fs.mkdirSync(`./json_offline/${theDay}`);
                        // } 


                        // const shortFileName=filename.substr(filename.lastIndexOf("/")+1);
                        // myLog(`shortFileName=${shortFileName}`)
                        // fs.moveSync(filename, `./json_offline/${theDay}/${shortFileName}`, function (err) {
                        //     if (err) return console.log(err)
                            
                        // });



                    }else{
                        myLog('file not found')
                        myLog('filename='+filename)

                    }

                    

                    console.log(filename)
                }
    
          
              
            }

            myLog(`Total update record ---> ${counter}`)

            client.end();


        });

};

main();












