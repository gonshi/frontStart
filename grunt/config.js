module.exports = function(grunt) {
  var testFiles = [];
  testFiles.push('test/**/*.js');

  return {
    dir: {
      src: 'src',
      tmp: '.tmp',
      dist: '..'
    },
    pkg: grunt.file.readJSON('package.json'),
    jade: {
      meta: grunt.file.readJSON('config/meta.json')
    },
    files: {
      testFiles: testFiles
    }
  };
};


// helper method

/**
 * [generate filesPath]
 * @param  {[Array]} arr  [file-path]
 * @param  {[type]} head [ファイルパスに付加するパス]
 * @param  {[boolean]} detach [trueの時、headで指定した文字列を取り除いたファイルパスを返すようになります]
 * @return {[type]}      []
 */

function genPath (arr, head, detach) {
  var i=0, len = arr.length;
  var isDetach = detach?true:false;
  var res = [],
      _h = head || '';
  var reg = new RegExp(head);
  if(!len) return [];
  if(isDetach) {
    for(;i<len;i++) {
      if(reg.test(res[i])) {
        res[i] = arr[i].split(head)[1];
      } else {
        res[i] = arr[i];
      }
    }
  } else {
    for(;i<len;i++) {
      res[i] = _h + arr[i];
    }
  }
  return res;
}
