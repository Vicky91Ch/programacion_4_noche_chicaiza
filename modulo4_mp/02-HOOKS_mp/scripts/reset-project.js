#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const root = process.cwd();
const nativeFolders = ['android', 'ios', 'macos', 'web'];
nativeFolders.forEach((folder) => {
  const folderPath = path.join(root, folder);
  if (fs.existsSync(folderPath)) {
    console.log(`Removing ${folder} folder`);
    fs.rmSync(folderPath, { recursive: true, force: true });
  }
});
const dotFiles = ['.expo'];
dotFiles.forEach((file) => {
  const filePath = path.join(root, file);
  if (fs.existsSync(filePath)) {
    console.log(`Removing ${file} file`);
    fs.rmSync(filePath, { recursive: true, force: true });
  }
});
console.log('Project reset complete!');