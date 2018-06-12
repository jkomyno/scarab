const fs      = require('fs')
const path    = process.argv[2]

const package = `${path}/package.json`

fs.readFile(package, 'utf8', (err, content) => {

  if (err) {
    return process.exit(1)
  }

  const cont = JSON.parse(content)

  const scripts = Object.assign({}, cont, {
    version: '0.0.1',
    scripts: {
      build: 'rollup index.js --o /dist/index.js --f cjs',
      start: 'rollup index.js --watch',
      test: 'jest'
    }
  })

  fs.writeFileSync(package, JSON.stringify(scripts, null, 2))
  return process.exit(0)

})