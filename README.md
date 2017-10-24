# AppLovinSDK_sample_iOS

# 以下があれば、全画面広告のサンプルが出せます。

# AppDelegate.swift

	// SDKの初期化。アプリ起動時に呼び出しておくと、バックグランドで広告を事前に読み込んでおけるので良いです。
    ALSdk.initializeSdk()

# ViewController.swift
	// 全画面広告が出せる状態の時に、全画面広告を出す。
	if(ALInterstitialAd.isReadyForDisplay()){
        ALInterstitialAd.show()
    }