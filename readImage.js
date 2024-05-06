let log = require('./utils/console');
const moment = require('moment');
let readFile = require('./readFile');
const sharp = require('sharp')

const fs = require('fs')
const dbHost = '127.0.0.1';
const dbPort = 7776;
const dbUser = 'admin';
const dbPassword = 'admin';
const dbName = 'postgres';

const { Client } = require('pg');

// const client = new Client({
//     user: dbUser,
//     password: dbPassword,
//     host: dbHost,
//     port: dbPort,
//     database: dbName,
// });

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

async function readImage(pk_panelid,dbClient){
 
        // const interval = moment(eDate).diff(moment(sDate), 'days');

        const myQuery0 = (fk_panelid) => {
            return new Promise((resolve, reject) => {
                dbClient.query(
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
  
        const myQuery1 = j => {
            return new Promise((resolve, reject) => {
                dbClient.query(
                    `select picpath,x1,y1,x2,y2 from xml_image where pk_imgid=$1`,[j],
                    (err, rows, fields) => {
                        //console.log(rows);
                        if (err) reject(err);
                        else resolve(rows);
                    }
                );
            });
        };
    
        const myQuery2 = (j, myBlob,code) => {
            return new Promise((resolve, reject) => {
                dbClient.query(
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


        const myData= await myQuery0(pk_panelid);
        const myRow1 = myData.rows;
        if (myRow1.length > 0) {

            for (let i = 0; i < myRow1.length; i++) {
                const pk_imgid = myRow1[i].pk_imgid;
                //myLog(pk_imgid);
                const myData2=await myQuery1(pk_imgid);
                const myRow2 = myData2.rows;

                if (myRow2.length > 0) {
                    const PicPath = myRow2[0].picpath;
                    //myLog(PicPath);
                    if (PicPath) {

                        const X1 = myRow2[0].x1;
                        const Y1 = myRow2[0].y1;
                        const X2 = myRow2[0].x2;
                        const Y2 = myRow2[0].y2;
                        const myPath = PicPath.replace("\\\\Yl1-smtaoi-nas\\aoi_ai", "\\home\\innodisk\\workspace\\Judy\\NVIDIA_TAO\\share");
    
                        const regex = /\\/g;
                        const PicPathNew = myPath.replace(regex, "/");
    
    
                        if (fs.existsSync(PicPathNew)) {
                            
                            
                            if ((X1) && (Y1) && (Y2) && (Y2)) {
    
                                try {
                                    // 有座標,截圖存檔
                                    const outputBuffer = await sharp(PicPathNew).extract({ left: X1, top: Y1, width: (X2 - X1), height: (Y2 - Y1) }).toBuffer();
                                    const mySave = await myQuery2(pk_imgid, outputBuffer,0);
                                    myLog(`${moment().format('YYYY-MM-DD HH:mm:ss')} Insert image : ${pk_imgid} success `)
                                    
                                    
                                    
                                } catch (error) {
    
                                    // 有座標,截圖存檔,但圖片損毀
                                    if (error.message.indexOf("Premature end of input file") >= 0) {
                                        myLog('file corrupt')
                                        const outputBuffer=await sharp('./assets/FileCorrupt.jpg').toBuffer();
                                        const mySave = await myQuery2(pk_imgid, outputBuffer,1); 
                                        myLog(`${moment().format('YYYY-MM-DD HH:mm:ss')} Insert image : ${pk_imgid} success `)
                                      
                                    }else{
                                        myLog('unknow error');
                                        console.log(error)
                                    }
                                }
                                
                            } else {
                               
                                // 無座標,放原圖
                                try {
                                    const outputBuffer = await sharp(PicPathNew).toBuffer();
                                    const mySave = await myQuery2(pk_imgid, outputBuffer,2);
                                    myLog(`${moment().format('YYYY-MM-DD HH:mm:ss')} Insert image : ${pk_imgid} success `)
                                    
                                } catch (error) {
    
                                    // 無座標,放原圖,但圖片損毀
                                    if (error.message.indexOf("Premature end of input file") >= 0) {
                                        log('file corrupt 2')
                                        const outputBuffer=await sharp('./assets/FileCorrupt.jpg').toBuffer();
                                        const mySave = myQuery2(pk_imgid, outputBuffer,3);
                                        log(`${moment().format('YYYY-MM-DD HH:mm:ss')} Insert image : ${pk_imgid} success `)
                                    
                                    }
                                }
                            }
                        }else{

                            myLog('file not exist')
                            const outputBuffer = await sharp('./assets/FileNotFound.jpg').toBuffer();            
                            const mySave = myQuery2(pk_imgid, outputBuffer,4);
                            myLog(`${moment().format('YYYY-MM-DD HH:mm:ss')} Insert image : ${pk_imgid} success `)
                                    
                                          
                        }
    
                    }
                }
           
            }
        }

}

module.exports = readImage;



