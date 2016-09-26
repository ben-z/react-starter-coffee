# Express + React Starter Template (Coffeescript)
A simple way to start isomorphic projects with [ReactJS], [ExpressJS], and [MongoDB].

[See the demo](http://react-starter-coffee.herokuapp.com/)

Ready to code? [Get started](#getting-started) or [view the tutorial version](https://github.com/ben-z/react-starter-coffee-tutorial)

### Directory Layout

```
.
├── /build/                     # The folder for compiled output
├── /src/                       # The source code of the application
│   ├── /app/                   # Javascript files
│   |   ├── /components/        # components of the application
│   |   └── /index.cjsx         # Entry-point / wrapper of the application
│   ├── /scss/                  # Stylesheets, written in scss
│   └── /server.coffee          # Server-side scripts
│── gulpfile.js                 # Configuration file for automated builds
└── package.json                # Information about the project (Dependencies, etc.)
```

### Compilation Reference

| Source Directory| Build Directory|
| :------------- | :------------- |
| src/server.coffee | build/server.js |
| src/app/index.cjsx | build/app/index.js |
| src/app/components/\*\*/*.cjsx | build/app/components/\*\*/*.js |
| src/scss/\*\*/*.scss | build/css/main.css |

### Getting Started

1. Make sure gulp is installed (We use this to compile the source files)

  ```shell
  $ npm install -g gulp # Install Gulp
  $ gulp --version # Check the version of Gulp
  > [13:07:08] CLI version 3.8.10
  > [13:07:08] Local version 3.8.11
  ```

2. Clone this repo

  ```shell
  $ git clone -o react-starter-coffee https://github.com/ben-z/react-starter-coffee.git App
  $ cd App
  $ npm install # Install the dependencies
  ```
3. Start Coding

  ```shell
  $ gulp develop # Navigate to http://localhost:3000
  ```
  The server is restarted automatically when files change.

### Gulp Tasks

```shell
$ gulp <task>
```

| Task | Description |
| :------------- | :------------- |
| cjsx | Compiles **src/app/\*\*/\*.cjsx** to **build/app/\*\*/\*.js**. |
| coffee | Compiles **src/\*\*/\*.coffee** to **build/\*\*/\*.js**. |
| sass | Compiles **src/scss/\*.scss** to **build/css/\*.css**. |
| env | Compiles **src/.env.yml** to **build/.env.json**. |
| build | Runs tasks **cjsx**, **coffee**, **sass**, and **env**. |
| watch | Watches all files and compile them accordingly. Restarts the server if the server is running |
| server | Starts the server with `node build/server.js` and runs **watch**. |

[ReactJS]: https://facebook.github.io/react/
[ExpressJS]: http://expressjs.com/
[MongoDB]: https://www.mongodb.org/

### Contributing

Have any feedbacks, feature requests, issues, or comments? Please feel free to [create an issue](https://github.com/ben-z/react-starter-coffee/issues) or [open a pull request](https://github.com/ben-z/react-starter-coffee/pulls).

### License
ISC
