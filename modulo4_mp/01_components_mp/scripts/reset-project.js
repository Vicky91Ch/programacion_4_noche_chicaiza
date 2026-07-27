#!/usr/bin/env node

/**
 * This script will remove the native folders and reset the project to a blank state.
 */

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const root = process.cwd();

const resetNative = () => {
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
};

const resetProject = () => {
  console.log('Resetting project...');
  resetNative();
  console.log('Project reset complete!');
};

resetProject();