var gulp = require('gulp'),
    prefixer = require('gulp-autoprefixer'),
    uglify = require('gulp-uglify'),
    sass = require('gulp-sass'),
    rigger = require('gulp-rigger'),
    cssmin = require('gulp-clean-css'),
    watch = require('gulp-watch');
    plumber = require('gulp-plumber'),
    browserSync = require("browser-sync"),
    reload = browserSync.reload,
    spritesmith = require('gulp.spritesmith');



gulp.task('style:build', function () {
    gulp.src("src/style/*.scss") 
        .pipe(plumber())
        .pipe(sass({
            includePaths: ['src/style/'],
            outputStyle: 'compressed',
            sourceMap: true,
            errLogToConsole: true
        }))
       /* .pipe(prefixer({ browsers: ['last 6 versions'] }))*/
        .pipe(cssmin({keepSpecialComments : 0}))
        .pipe(gulp.dest("catalog/view/theme/default/css/"))
        .pipe(reload({stream: true}));
});


gulp.task('js:build', function () {
    gulp.src("src/js/main.js")
    	.pipe(plumber())
    	.pipe(rigger())
        .pipe(uglify()) 
        .pipe(gulp.dest("catalog/view/javascript/"))
        .pipe(reload({stream: true}));
});





gulp.task('browser-sync', function() {
	var files = [
	'*'
    ];
    //initialize browsersync
    browserSync.init(files, {
    //browsersync with a php server
    proxy: "fidelliti.loc/",
    port: 8080,
    injectChanges: true,
    /*tunnel: true,*/
    });
});


gulp.task('sprite', function() {
    var spriteData = 
        gulp.src("src/img/icons/*.png") 
            .pipe(spritesmith({
                imgName: 'sprite.png',
                cssName: 'sprite.scss',
                imgPath: '/image/sprite.png'
            }));

    spriteData.img.pipe(gulp.dest('image/')); 
    spriteData.css.pipe(gulp.dest('src/style/partials/'));
});



gulp.task('watch', function(){
    watch(["./src/style/**/*.scss"], function(event, cb) {
        gulp.start('style:build');
    });
    watch(["./src/js/*.js"], function(event, cb) {
        gulp.start('js:build');
    });
    watch(["./catalog/view/**/*"], function(event, cb) {
        reload();
    });
});


gulp.task('default', ['js:build', 'style:build', 'watch', 'browser-sync']);