var cjsx = require('gulp-cjsx');
var gulp = require('gulp');
var gutil = require('gulp-util');
var coffee = require('gulp-coffee');
var spawn = require('child_process').spawn;
var node;
var del = require('del');
var fs = require('fs');
var sass = require('gulp-sass');

var buildDir = './build/';

// Compile Coffeescript jsx files
gulp.task('cjsx', function() {
  gulp.src('./src/**/*.cjsx')
    .pipe(cjsx({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest(buildDir));
});

// Compile Coffeescript
gulp.task('coffee', function() {
  gulp.src('./src/**/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest(buildDir))
});

gulp.task('scss', function () {
  gulp.src('./src/scss/*.scss')
    .pipe(sass())
    .pipe(gulp.dest(buildDir+'css'));
});

gulp.task('build',['cjsx', 'coffee', 'scss']);

// Start the server in ./build
gulp.task('server', function() {
  if (node) node.kill();
  if(!fs.existsSync(buildDir+'server.js')){
    console.log(buildDir+'server.js not found, retrying...');
    return setTimeout(function () {
      if(!fs.existsSync('./build')){
        console.log('./build folder not found, please run \'gulp build\'');
      }else{
        gulp.start('server');
      }
    }, 2000);
  }
  node = spawn('node', [buildDir+'server.js'], {stdio: 'inherit'});
  node.on('close', function (code) {
    if (code === 8) {
      console.log('Error detected, waiting for changes...');
    }
  });
});

// Reloads the server
gulp.task('reload', function(){
  if (node) {
    console.log('Reloading Server');
    gulp.start('server');
  }
});

// Watches for file changes
gulp.task('watch', function(){
  gulp.watch('./src/**/*.cjsx', ['cjsx','reload']);
  gulp.watch('./src/**/*.coffee', ['coffee','reload']);
  gulp.watch('./src/scss/*.scss', ['scss']);
  gulp.watch('./src/.env.yml', ['env','reload']);
});

gulp.task('develop', ['build', 'server', 'watch']);

gulp.task('clean', function () {
  del([
    './build'
  ]);
});

gulp.task('start_server', ['build', 'server']);

// kill the node process on exit
process.on('exit', function() {
    if (node) node.kill();
});
