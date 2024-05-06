const log = require('./utils/console');
const convert = require('xml-js');
const fs = require('fs');

// const columnNamePanel = ['cmodel', 'lotno', 'stationid', 'fdate', 'cycletime', 'operator', 'confirmtime', 'status', 'machine', 'carrier', 'lane', 'stdimage'];
// const columnNameBoard = ['imulti', 'topbtm', 'boardsn', 'status', 'totalcomp', 'failcomp'];
// const columnNameComponent = ['compname', 'tb', 'type', 'packagetype', 'status', 'machinedefect','confirmdefect','ai_result','ai_version','partno','pincount'];
// const columnNameImage = ['picpath', 'x1', 'y1', 'x2', 'y2', 'camera','angle'];


const columnNamePanel = ['cModel', 'LotNo', 'StationId', 'fdate', 'CycleTime', 'Operator', 'ConfirmTime', 'Status', 'Machine', 'Carrier', 'Lane', 'StdImage'];
const columnNameBoard = ['imulti', 'TopBtm', 'BoardSN', 'Status', 'TotalComp', 'FailComp'];
const columnNameComponent = ['CompName', 'TB', 'Type', 'PackageType', 'Status', 'MachineDefect', 'ConfirmDefect', 'AI_result', 'AI_Version', 'PartNo', 'PinCount'];
const columnNameImage = ['PicPath', 'X1', 'Y1', 'X2', 'Y2', 'Camera', 'Angle'];



const composeSqlImage = (item5) => {

    let myPar7 = "";
    let myPar8 = "";
    columnNameImage.forEach((item6) => {

        myPar7 += (myPar7 === "") ? item6 : `,${item6}`;
        myPar8 += ((myPar8 === "") ? '' : ',') + ((item5._attributes[item6]) ? `'${item5._attributes[item6].replace("'", "")}'` : 'NULL');

    });
    return `Insert into xml_image (fk_compid,fk_boardid,fk_panelid,${myPar7.toLowerCase()}) values (KEY3,KEY2,KEY1,${myPar8}) returning pk_imgid into KEY4;`;

}


async function readFileSync(path) {
    return new Promise((resolve, reject) => {
        fs.readFileSync(path, 'utf8', function (err, data) {
            if (err) {
                reject(err);
            }
            resolve(data);
        });
    });
}

async function readFile(fileName) {


    const xmlFile = fs.readFileSync(fileName, 'utf8', function (err, data) {
        if (err) {
            reject(err);
        }
        resolve(data);
    });


    // parse xml file as a json object
    const jsonData = JSON.parse(convert.xml2json(xmlFile, { compact: true, spaces: 2 }));

    let myPar1 = "";
    let myPar2 = "";
    columnNamePanel.forEach((item) => {
        //log(`--- ${item} ---`);
        //log(jsonData["Panel"]._attributes[item]);
        myPar1 += (myPar1 === "") ? `"${item}"` : `,"${item}"`;
        if (item === 'StdImage') {
            const StdImageOld = jsonData["Panel"]._attributes[item];
            if (StdImageOld) {
                const regex = /\\/g;
                const StdImageNew = StdImageOld.replace(regex, "\\\\");
                myPar2 += (myPar2 === "") ? `'${StdImageNew}'` : `,'${StdImageNew}'`;
            } else {
                myPar2 += (myPar2 === "") ? `NULL` : `,NULL`;
            }

        } else {
            if (jsonData["Panel"]._attributes[item]) {
                myPar2 += (myPar2 === "") ? `'${jsonData["Panel"]._attributes[item]}'` : `,'${jsonData["Panel"]._attributes[item]}'`;
            } else {
                myPar2 += (myPar2 === "") ? `NULL` : `,NULL`;
            }

        }
    });

    const fileNameOld = fileName;



    const regex = /\\/g;
    const fileNameNew = fileNameOld.replace(regex, "\\\\");


    const myStr1 = `Insert into xml_panel (${myPar1.toLowerCase()},filename) values (${myPar2},'${fileNameNew}') returning pk_panelid into KEY1;`;
    //console.log(myStr1);

    let myStr2 = "";
    let myStr3 = "";


    if (jsonData["Panel"].Board.length > 1) {
        //log('multi')
        jsonData["Panel"].Board.forEach((item, idx) => {
            //console.log(`(${idx})-------------------------`);
            let myPar3 = "";
            let myPar4 = "";
            columnNameBoard.forEach((subItem) => {
                //console.log(`--- ${subItem} ---`);
                //console.log(item._attributes[subItem]);
                myPar3 += ((myPar3 === "") ? '' : ',') + `${subItem}`;
                myPar4 += ((myPar4 === "") ? '' : ',') + ((item._attributes[subItem]) ? `'${item._attributes[subItem].replace("'", "")}'` : 'NULL');

            });
            myStr2 += `Insert into xml_board (fk_panelid,${myPar3.toLowerCase()}) values (KEY1,${myPar4}) returning pk_boardid into KEY2;`;



            if (item.Component) {

                if (item.Component.length > 1) {

                    item.Component.forEach((item3) => {
                        //log('--- item3 ---');
                        //console.log(item3)
                        let myPar5 = "";
                        let myPar6 = "";
                        columnNameComponent.forEach((item4) => {
                            myPar5 += ((myPar5 === "") ? '' : ',') + `${item4}`;
                            myPar6 += ((myPar6 === "") ? '' : ',') + ((item3._attributes[item4]) ? `'${item3._attributes[item4].replace("'", "")}'` : 'NULL');


                        });
                        myStr2 += `Insert into xml_component (fk_boardid,fk_panelid,${myPar5.toLowerCase()}) values (KEY2,KEY1,${myPar6}) returning pk_compid into KEY3;`;

                        if (item3.CompImage) {

                            //log('--- item3.CompImage ---');
                            //console.log(item3.CompImage)
                            if (item3.CompImage.Image.length > 1) {

                                item3.CompImage.Image.forEach((item5) => {

                                    myStr2 += composeSqlImage(item5);

                                });



                            } else {

                                const item5 = item3.CompImage.Image;

                                myStr2 += composeSqlImage(item5);
                            }

                        }



                    })

                }
                else {

                    const item3 = item.Component;
                    let myPar5 = "";
                    let myPar6 = "";
                    columnNameComponent.forEach((item4) => {
                        myPar5 += ((myPar5 === "") ? '' : ',') + `${item4}`;
                        myPar6 += ((myPar6 === "") ? '' : ',') + ((item3._attributes[item4]) ? `'${item3._attributes[item4].replace("'", "")}'` : 'NULL');

                    });
                    myStr2 += `Insert into xml_component (fK_boardid,fk_panelid,${myPar5.toLowerCase()}) values (KEY2,KEY1,${myPar6}) returning pk_compid into KEY3;`;

                    if (item3.CompImage) {

                        //log('--- item3.CompImage ---');
                        //console.log(item3.CompImage)
                        if (item3.CompImage.Image.length > 1) {

                            item3.CompImage.Image.forEach((item5) => {
                                myStr2 += composeSqlImage(item5);
                            });

                        } else {

                            const item5 = item3.CompImage.Image;
                            myStr2 += composeSqlImage(item5);

                        }

                    }

                }
            }


        });
    } else {
        //log('single')
        const item = jsonData["Panel"].Board;
        let myPar3 = "";
        let myPar4 = "";
        columnNameBoard.forEach((subItem) => {
            //console.log(`--- ${subItem} ---`);
            //console.log(item._attributes[subItem]);
            myPar3 += ((myPar3 === "") ? '' : ',') + `${subItem}`;
            myPar4 += ((myPar4 === "") ? '' : ',') + ((item._attributes[subItem]) ? `'${item._attributes[subItem].replace("'", "")}'` : 'NULL');
        });
        myStr2 += `Insert into xml_board (fk_panelid,${myPar3.toLowerCase()}) values (KEY1,${myPar4}) returning pk_boardid into KEY2;`;

        //log('--- item ---');
        //console.log(item)

        if (item.Component) {

            if (item.Component.length > 0) {

                item.Component.forEach((item3) => {

                    let myPar5 = "";
                    let myPar6 = "";
                    columnNameComponent.forEach((item4) => {
                        myPar5 += ((myPar5 === "") ? '' : ',') + `${item4}`;
                        myPar6 += ((myPar6 === "") ? '' : ',') + ((item3._attributes[item4]) ? `'${item3._attributes[item4].replace("'", "")}'` : 'NULL');
                    });
                    myStr2 += `Insert into xml_component (fk_boardid,fk_panelid,${myPar5.toLowerCase()}) values (KEY2,KEY1,${myPar6}) returning pk_compid into KEY3;`;

                    if (item3.CompImage) {

                        //log('--- item3.CompImage ---');
                        //console.log(item3.CompImage)

                        if (item3.CompImage.Image.length > 1) {

                            item3.CompImage.Image.forEach((item5) => {
                                myStr2 += composeSqlImage(item5);

                            });

                        } else {

                            const item5 = item3.CompImage.Image;
                            myStr2 += composeSqlImage(item5);

                        }

                    }




                })

            } else {

                const item3 = item.Component;

                let myPar5 = "";
                let myPar6 = "";
                columnNameComponent.forEach((item4) => {
                    myPar5 += ((myPar5 === "") ? '' : ',') + `${item4}`;
                    myPar6 += ((myPar6 === "") ? '' : ',') + ((item3._attributes[item4]) ? `'${item3._attributes[item4].replace("'", "")}'` : 'NULL');

                });
                myStr2 += `Insert into xml_component (fk_boardid,fk_panelid,${myPar5.toLowerCase()}) values (KEY2,KEY1,${myPar6}) returning pk_compid into KEY3;`;

                if (item3.CompImage) {

                    //log('--- item3.CompImage ---');
                    //console.log(item3.CompImage)

                    if (item3.CompImage.Image.length > 1) {

                        item3.CompImage.Image.forEach((item5) => {
                            myStr2 += composeSqlImage(item5);

                        });

                    } else {

                        const item5 = item3.CompImage.Image;
                        myStr2 += composeSqlImage(item5);

                    }

                }

            }

        }
    }

    const mySQL = `
    CREATE OR REPLACE FUNCTION insert_file_data()
    RETURNS INTEGER AS $$ 
    DECLARE 
    KEY1 INTEGER;
    KEY2 INTEGER;
    KEY3 INTEGER;
    KEY4 INTEGER;
    BEGIN
    `+ myStr1 + myStr2 + `
    RETURN KEY1;
    END $$ LANGUAGE plpgsql;
    SELECT insert_file_data();
    `;

    return mySQL;

}

module.exports = readFile;

