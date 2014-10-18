module.exports = {
    temp:['<%= config.dir.tmp %>/**/*'],
    prod:{
      all: ['<%= config.dir.dist %>/**/*'],
      exclude: ['!<%= config.dir.dist %>/_build/**']
    },
    bower:['<%= config.dir.src %>/js/lib/*']
};
