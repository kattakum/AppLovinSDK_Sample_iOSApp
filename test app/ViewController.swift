//
//  ViewController.swift
//  test app
//
//  Created by Tomoya Katagi on 2017/10/22.
//  Copyright © 2017 Tomoya Katagi. All rights reserved.
//

import UIKit
import AppLovinSDK

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getInterstitial(_ sender: Any) {
        // 広告が出せる状態か確認。
        if(ALInterstitialAd.isReadyForDisplay()){
            ALInterstitialAd.show()
        }else{
            print("Cannot get Interstitial ads")
        }
        
    }
    @IBAction func getBanner(_ sender: Any) {
        
        var adView: ALAdView?
        
        // バナー枠のサイズや位置を定義
        let kBannerHeight: CGFloat = 50
        let toolbarHeight = navigationController?.toolbar.frame.height ?? 0
        let bannerframe = CGRect(x: 0, y: self.view.bounds.height - kBannerHeight - toolbarHeight, width: self.view.bounds.width, height: kBannerHeight)
        
        // バナーのView(ALAdViewインスタンス)を作成
        adView = ALAdView(frame: bannerframe, size: ALAdSize.sizeBanner(), sdk: ALSdk.shared()!)
        if let adView = adView
        {
            // 始めのバナーを表示
            adView.loadNextAd()
            self.view.addSubview(adView)
            // 10秒おきにバナーの入れ替え
            Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true, block: { (Timer) in
                adView.loadNextAd()
                self.view.addSubview(adView)
            })
        }
        
    }
    
    @IBAction func getNative(_ sender: Any) {
        
    }
    
    @IBAction func getRectangle(_ sender: Any) {
        
        var adView: ALAdView?
        
        // レクタングル枠のサイズや位置を定義
        let kMRecHeight: CGFloat = 250
        let kMRecWidth: CGFloat = 300
        let frame = CGRect(x: self.view.bounds.midX - kMRecWidth/2, y: 80, width: kMRecWidth, height: kMRecHeight)
        
        // レクタングルのView(ALAdViewインスタンス)を作成
        adView = ALAdView(frame: frame, size: ALAdSize.sizeMRec(), sdk: ALSdk.shared()!)
        
        if let adView = adView
        {
            // 広告を読み込みを枠にセットする
            adView.loadNextAd()
            self.view.addSubview(adView)
            
            // 3秒後に広告を閉じる
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                adView.removeFromSuperview()
            }
        }
    }
    
}

