# Readme

* grunt-coffeeifyは普通のcoffeeifyにする
##### dev
開発用タスク。

* jshintの実行
* /src/js, /src/top, /src/img以下のファイル群を/.tmp以下にコピー
* jadeのコンパイル
* compass compileを実行
* nodeサーバーの立ち上げ（localhost:9000; ルートディレクトリは/.tmp）
* watch及びlivereload

#### build
* production版のファイルを作成
* destinationは1階層下のディレクトリ(開発ディレクトリは/\_buildを想定)

### sass

- src/sass: sassファイルを管理
- base: reset, mixin, 変数などを管理
- \_value.scss: グローバル変数をここで定義


### Jade
- includeファイルはすべて'/jade/include'以下にまとめて管理する
- mixinファイルはすべて'/jade/mixin'以下にまとめて管理する
