module.exports = {
    temp:['<%= config.dir.tmp %>/**/*'],
    prod:{
      src: [ '<%= config.dir.dist %>/img/**/*' ]
    },
    bower:['<%= config.dir.src %>/js/lib/*']
};
