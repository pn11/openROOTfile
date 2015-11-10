#include<iostream>
#include<TFile.h>
#include<TApplication.h>
#include<TBrowser.h>

int main(int argc, char* argv[]){
  using namespace std;

  TFile *f[99];
  for (int iarg = 1; iarg < argc; iarg++){
   f[iarg] = new TFile(argv[iarg]);
  }

  TApplication *app = new TApplication("app", &argc, argv);

  TBrowser *b = new TBrowser();

  app->Run();

  return 0;
}


