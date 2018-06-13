# 🌺 Scarab

[MIT](https://img.shields.io/badge/license-MIT-blue.svg)

Scarab is a simple command line tool that I use to initialize my Node.js projects. <br />
I usually use Rollup as a module bundler, ESLint as a linter and `nvm` in order to manage my Node.js istances, so I decided to make a script to automatize the initialization process for my projects using my "default" project boilerplate.

# 🔮 Requirements

- Node.js
- Yarn

I'll probably improve my script to detect if Node/Yarn are already installed

# 💾 Installation

```sh
$ curl -o- https://raw.githubusercontent.com/micheleriva/scarab/master/install.sh | bash
```

# ⚔️ Usage

```sh
$ scarab init <project-name>
```

# 📦 What you get

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

# 👾 About the name "Scarab"

I wanted to call that script "Genesis", but it sounded a little sanctimonious, so I decided to call it like an amazing song from the australian band Northlane, which is the track right after the song "genesis". [Check it out!](https://www.youtube.com/watch?v=2wO6NQz7ylc)

# 📜 License
[MIT](/LICENSE.md)
