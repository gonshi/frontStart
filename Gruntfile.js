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

    grunt.registerTask('dev', function() {
        grunt.task.run([
            'clean:temp',
            'browserify',
            'copy:img',
            'jade:compile',
            'compass:dev',
            'server'
        ]);
    });

    grunt.registerTask('build', function() {
        grunt.task.run([
            'clean:prod',
            'browserify',
            'uglify:apps',
            'copy:imgProd',
            'compass:prod',
            'jade:prod'
        ]);
    });
};
