# 🌺 Scarab

Scarab is a simple command line tool that I use to initialize my Node.js projects. <br />

# Requirements

- Node.js
- Yarn

I'll probably improve my script to detect if Node/Yarn are already installed

# Installation

```sh
$ curl -o- https://raw.githubusercontent.com/micheleriva/scarab/master/install.sh | bash
```

# Usage

```sh
$ scarab init <project-name>
```

# What you get

You will get the following folder structure

```
<Project Name>
  |_ tests/
  |_ dist/
  |_ src/
  |_ .nvmrc
  |_ .eslintrc.js
  |_ .travis.yml
  |_ .gitignore
  |_ index.js
  |_ package.json
```

You will also get the following `Package.json` file:

```json
{
  "name": "foo",
  "version": "0.0.1",
  "main": "index.js",
  "license": "MIT",
  "devDependencies": {
    "jest": "^23.1.0"
  },
  "scripts": {
    "build": "rollup index.js --o /dist/index.js --f cjs",
    "start": "rollup index.js --watch",
    "test": "jest"
  }
}
```

# License
[MIT](/LICENSE.md)