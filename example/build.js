var process = require('process');
const execSync = require('child_process').execSync;

let curDir = process.cwd();
console.log('Working: ' + curDir);
try {
  process.chdir('../');
  console.log('in: ' + process.cwd());
  execSync('yarn pack', {stdio:[0,1,2]});
  process.chdir(curDir);
  execSync('yarn remove react-native-file-preview', {stdio:[0,1,2]});
  execSync('yarn add ../react-native-file-preview-v1.0.0.tgz', {stdio:[0,1,2]});
} catch (err) {
  console.log('chdir: ' + err);
}
