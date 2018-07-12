const fs   = require('fs')
const path = require('path')

const currentDir = path.resolve(__dirname)

const read = filename => fs.readFileSync(`${currentDir}/filesToWrite/${filename}`)

const files = [
  {
    name: '.gitignore',
    content: read('.gitignore')
  },
  {
    name: '.nvmrc',
    content: read('.nvmrc')
  },
  {
    name: '.travis.yml',
    content: read('.travis.yml')
  },
  {
    name: 'rollup.config.js',
    content: read('rollup.config.js')
  },
  {
    name: 'README.md',
    content: '# Project name'
  },
  {
    name: 'LICENSE.md',
    content: read('LICENSE.md')
  },
  {
    name: 'tsconfig.json',
    content: read('tsconfig.json')
  }
]

module.exports = files