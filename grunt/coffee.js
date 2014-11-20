module.exports = {
  dev: {
    files: {
      '<%= config.dir.tmp %>/js/app.js': '<%= config.dir.src %>/coffee/**/*.coffee'
    }
  },
  prod: {
    files: {
      '<%= config.dir.dist %>/js/app.js': '<%= config.dir.src %>/coffee/**/*.coffee'
    }
  }
};
