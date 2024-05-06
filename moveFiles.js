
const log = require('./utils/console');
const moment = require('moment');
 
const fs = require('fs-extra');
 
const sDate = '2024-04-22';
const eDate = '2024-04-25';
 
 
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
 
 
async function main() {
 
 
    myLog("move files start!");
    const interval = moment(eDate).diff(moment(sDate), 'days');
 
    
    for (let j = 0; j < (interval + 1); j++) {
        const theDate = moment(sDate).add(j, 'days').format('YYYYMMDD');
 
        let filesInTheFolder = getFiles(`/home/innodisk/share/Runtime/igrafana`);
 
        filesInTheFolder = filesInTheFolder.filter((item) => {  
            if (item.indexOf(theDate)>=0){
                return item;
            }
        })
 
 
        myLog(`---------- Process Date ${theDate} Data ----------`)
        //myLog(`---------- Total File Num : ${filesInTheFolder.length} ----------`)
 
        for (let i = 0; i < filesInTheFolder.length; i++) {
 
        
            myLog(`---------- Progress : ${((i+1)/filesInTheFolder.length*100).toFixed(2)}% (${i+1}/${filesInTheFolder.length}) ----------`)
            const filepath=filesInTheFolder[i];
            const filename=filepath.substr(filepath.lastIndexOf("/")+1).replace(".xml",".json");
 
            
            myLog(`move file : ${filename}`)
 
            //move file is folder not exist create
            if (!fs.existsSync(`./json/${theDate}`)){
                fs.mkdirSync(`./json/${theDate}`);
            }  
            
            fs.moveSync(filesInTheFolder[i], `./json/${theDate}/${filename}`, function (err) {
                if (err) return console.log(err)
                
            });
 
            myLog(`move file success : ${filesInTheFolder[i]}`)
 
        }
    }
 
    myLog("move files end!");
 
};
 
main();
 
 
 
 
 
 
 
 
 
 
 
 
