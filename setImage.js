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
 

 
// 2023-12
const sPoint = 1;
const ePoint = 12482;
 
// Start 2024-03-11 09:24 => 191G
// End
 
const { Client } = require('pg');
 
const client = new Client({
    user: dbUser,
    password: dbPassword,
    host: dbHost,
    port: dbPort,
    database: dbName,
});
 
async function main(){
    client.connect(async function (err) {
        if (err) throw err;
        log(`${moment().format('YYYY-MM-DD HH:mm:ss')} : database are connected!`);
    
    
        // const interval = moment(eDate).diff(moment(sDate), 'days');
    
        const myQuery1 = j => {
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
    
        const myQuery2 = (j, myBlob,code) => {
            return new Promise((resolve, reject) => {
                client.query(
                    `    
                    INSERT INTO xml_picture
                        (fk_imgid, cropimage, code)
                    VALUES
                        ($1, $2, $3)
                    ON CONFLICT (fk_imgid)
                    DO UPDATE SET cropimage = $2, code= $3;
                    `
                    ,[j,myBlob,code],
                    (err, rows, fields) => {
                        if (err) reject(err);
                        else resolve(rows);
                    }
                );
            });
        };
    
        //let j=sPoint
        for (let j = sPoint; j < (ePoint + 1); j++) {
 
            let myBlob = null;
           
            const myResult1=await myQuery1(j);
            const myRow = myResult1.rows;
 
            if (myRow.length > 0) {
                const PicPath = myRow[0].picpath;
 
                if (PicPath) {
 
                    const X1 = myRow[0].x1;
                    const Y1 = myRow[0].y1;
                    const X2 = myRow[0].x2;
                    const Y2 = myRow[0].y2;
                    const myPath = PicPath.replace("\\\\Yl1-smtaoi-nas\\aoi_ai", "\\home\\innodisk\\share");
 
                    const regex = /\\/g;
                    const PicPathNew = myPath.replace(regex, "/");
 
                    log(`--- ${moment().format('YYYY-MM-DD HH:mm:ss')} : ${j} ---`)
                    log(PicPathNew);
 
                    if (fs.existsSync(PicPathNew)) {
                        if ((X1) && (Y1) && (Y2) && (Y2)) {
 
                            try {
                                // 有座標,截圖存檔
                                const outputBuffer = await sharp(PicPathNew).extract({ left: X1, top: Y1, width: (X2 - X1), height: (Y2 - Y1) }).toBuffer();
                                const mySave = await myQuery2(j, outputBuffer,0);
                                log(`[0] ${moment().format('YYYY-MM-DD HH:mm:ss')} Insert image : ${j} success ---> ${((j-sPoint)/(ePoint-sPoint)*100).toFixed(2)}%`)
                                
                                
                                
                            } catch (error) {
 
                                // 有座標,截圖存檔,但圖片損毀
                                if (error.message.indexOf("Premature end of input file") >= 0) {
                                    log('file corrupt')
                                    const outputBuffer=await sharp('./assets/FileCorrupt.jpg').toBuffer();
                                    const mySave = await myQuery2(j, outputBuffer,1); 
                                    log(`[1] ${moment().format('YYYY-MM-DD HH:mm:ss')} Insert image : ${j} success ---> ${((j-sPoint)/(ePoint-sPoint)*100).toFixed(2)}%`)
                                  
                                }
                            }
                            
                        } else {
                           
                            // 無座標,放原圖
                            try {
                                const outputBuffer = await sharp(PicPathNew).toBuffer();
                                const mySave = await myQuery2(j, outputBuffer,2);
                                log(`[2] ${moment().format('YYYY-MM-DD HH:mm:ss')} Insert image : ${j} success ---> ${((j-sPoint)/(ePoint-sPoint)*100).toFixed(2)}%`)
                                
                            } catch (error) {
 
                                // 無座標,放原圖,但圖片損毀
                                if (error.message.indexOf("Premature end of input file") >= 0) {
                                    log('file corrupt 2')
                                    const outputBuffer=await sharp('./assets/FileCorrupt.jpg').toBuffer();
                                    const mySave = myQuery2(j, outputBuffer,3);
                                    log(`[3] ${moment().format('YYYY-MM-DD HH:mm:ss')} Insert image : ${j} success ---> ${((j-sPoint)/(ePoint-sPoint)*100).toFixed(2)}%`)
                                
                                }
                            }
                        }
                    }else{
                        const outputBuffer = await sharp('./assets/FileNotFound.jpg').toBuffer();            
                        const mySave = myQuery2(j, outputBuffer,4);
                        log(`[4] ${moment().format('YYYY-MM-DD HH:mm:ss')} Insert image : ${j} success ---> ${((j-sPoint)/(ePoint-sPoint)*100).toFixed(2)}%`)
                                
                                      
                    }
 
                }
            }
 
        }
    
        client.end();
    });
 
    
}
 
main();
 
 
//con.end();