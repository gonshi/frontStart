'use strict';

module.exports = function(grunt) {
    require('load-grunt-config')(grunt);

    grunt.registerTask('server', function() {
        grunt.task.run([
            'configureProxies',
            'connect:server',
            'esteWatch'
        ]);
    });

    grunt.registerTask('test', [
        'jshint:all',
        'karma'
    ]);

    grunt.registerTask('default', function() {
        grunt.task.run([
            'jshint:all'
        ]);
    });

    grunt.registerTask('dev', function() {
        grunt.task.run([
            'clean:temp',
            'jshint:all',
            'copy:js',
            'copy:img',
            'jade:compile',
            'compass:dev',
            'server'
        ]);
    });

    grunt.registerTask('build', function() {
        grunt.task.run([
            'clean:prod',
            'concat:js',
            'uglify:apps',
            'copy:jsProd',
            'copy:imgProd',
            'compass:prod',
            'jade:prod'
        ]);
    });

    grunt.registerTask('bi', [
        'bower:install'
    ]);

};


//-----------------------
// Private Methods
//-----------------------
