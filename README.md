MacでダブルクリックでROOTファイルを開くためのアプリケーション
===
ROOTファイルをダブルクリックするとTBrowserで開かれるようにした。端末が開かれるほうが便利かもしれない。あとはクイックルックでファイルの中身が見れたりするとよい。


##ファイル説明
```openROOTfile.workflow```がアプリをつくるためのAutomatorのスクリプト。このスクリプトが簡単なプログラム```startTBrowser```を呼び出す。ソースは```startTBrowser.cc```で```Makefile```を使って```make```できる。

##使い方
###環境設定
ROOTが```~/root```にインストールされているとする。つまり環境変数```$ROOTSYS```が````~/root```になっていて、パスとかも通っている。一応パスの設定を書いておくと、

```
export ROOTSYS=~/root 
export PATH=$ROOTSYS/bin:$PATH
export ROOTLIB=`root-config --libdir`
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROOTLIB

```

###startTBrowserのコンパイル
```make startTBrowser```で```make```する。

###openROOTfile.workflowをappにする
```openROOTfile.workflow```をダブルクリックするとAutomatorが開くので編集してappにconvertする。```startTBrowser```の場所を指定する必要がある。パス通してもいいかも。初期状態では```~/git/openROOTfile```にあるとしている。

###ROOTファイルを開く
ROOTファイルを開くプログラムを```openROOTfile.app```に指定してからダブルクリックすると見れるようになる。起動に時間かかるし、ちゃんと終了できないけど、なんとか使える。複数選択して開くこともできる。

