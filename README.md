MacのFinderからダブルクリックでROOTファイルを開く
===
ROOTファイルをダブルクリックするとTBrowserで開かれるようにした。端末が開かれるほうが便利かもしれない (iTerm2 の AppleScriptを使ってできるはず)。あとはクイックルックでファイルの中身が見れたりするとよい。


## ファイル説明

`openROOTfile.workflow` がアプリをつくるためのAutomatorのスクリプト。このスクリプトが簡単なプログラム `startTBrowser` を呼び出す。ソースは `startTBrowser.cc` で `Makefile` を使って `make` できる。

## 使い方
### 環境設定

ROOTが `~/root` にインストールされているとする。つまり環境変数 `$ROOTSYS` が `~/root` になっていて、パスとかも通っている。一応パスの設定を書いておくと、

```bash
export ROOTSYS=~/root 
export PATH=$ROOTSYS/bin:$PATH
export ROOTLIB=`root-config --libdir`
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROOTLIB
```

### startTBrowserのコンパイル

`make startTBrowser` で `make` する。

### openROOTfile.workflowをappにする

`openROOTfile.workflow` をダブルクリックするとAutomatorが起動するので、`File`メニューから`Convert to`を選んで`Application`を選ぶ（日本語OSのメニューだと何ていうのかは知らない）。`startTBrowser` の場所を指定する必要がある(`cd ~/git/openROOTfile`という行を編集する)。パス通してもいいかも。初期状態では `~/git/openROOTfile` にあるとしている。編集したら`.app`として保存する。

### ROOTファイルを開く

ROOTファイルを開くプログラムを `openROOTfile.app` に指定してからダブルクリックすると見れるようになる。起動に時間かかるし、ちゃんと終了できないけど、なんとか使える。複数選択して開くこともできる。

![こんな感じで開かれる](https://raw.githubusercontent.com/pn11/openROOTfile/master/fig/fig1.png)

### 終了

ウィンドウを閉じてもプロセスが終了しないので、メニューバーでくるくる回ってる歯車をクリックして、×をクリックして終了する（下図参照）。

![こんな感じで開かれる](https://raw.githubusercontent.com/pn11/openROOTfile/master/fig/fig2.png)

### 挙動

- 2つ以上は同時に走らない。