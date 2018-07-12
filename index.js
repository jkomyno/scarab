#!/usr/bin/env node

const fs       = require('fs')
const chalk    = require('chalk')
const files    = require('./src/files')
const { exec } = require('child_process')

// Let's start!
const currentDir  = process.cwd()
const projectName = process.argv[2]

// Check if directory exist
const killProcess = () => {
  console.log(chalk.red('[Error] 💀 Project already exist'))
  process.exit(1)
}

(fs.existsSync(projectName) ? killProcess() : fs.mkdirSync(projectName))

// Absolute dirname of new project
const projectDir = `${currentDir}/${projectName}/`

// Create basic files
files.map(file => {

  console.log(chalk.green(`Writing ${file.name}`))
  fs.writeFileSync(projectDir + file.name, file.content, 'utf8')

})

// Initialize yarn project
exec(`cd ${projectDir} && yarn init -y`, (error, stdout) => {
  
  if(error) {
    console.log(chalk.red(error))
    process.exit(1)
  } else {
    console.log(chalk.white(stdout))
    configPackage()
  }

})

const configPackage = () => {

  const packageContent = fs.readFileSync(`${projectDir}package.json`, 'utf8')
  
  const newContent = Object.assign({}, JSON.parse(packageContent), {
    devDependencies: {
      "@types/jest": "^23.1.1",
      "jest": "^23.1.0",
      "rollup-plugin-typescript": "^0.8.1",
      "rollup-plugin-uglify": "^4.0.0",
      "rollup-watch": "^4.3.1",
      "ts-jest": "^22.4.6"
    },
    "scripts": {
      "build": "rollup -c",
      "dev": "rollup -c -w",
      "test": "jest"
    },
    "jest": {
      "transform": {
        "^.+\\.tsx?$": "ts-jest"
      },
      "testRegex": "(/tests/.*|(\\.|/)(test|spec))\\.(jsx?|tsx?)$",
      "moduleFileExtensions": [
        "ts",
        "tsx",
        "js",
        "jsx",
        "json",
        "node"
      ]
    }
  })

  fs.writeFile(projectDir + 'package.json', JSON.stringify(newContent, null, 2) ,'utf8', () => {
    console.log(chalk.green('Installing dependencies, this can take a few seconds...'))
    exec(`cd ${projectDir} && yarn install`, (err, stdout) => {
      console.log(chalk.white(stdout))
    })
  })
}

// Now install typescript dependencies
console.log(chalk.green('Creating basic files and directories'))
exec(`cd ${projectDir} && mkdir tests dist src && touch index.ts`)