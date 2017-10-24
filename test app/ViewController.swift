//
//  ViewController.swift
//  test app
//
//  Created by Tomoya Katagi on 2017/10/22.
//  Copyright © 2017 Tomoya Katagi. All rights reserved.
//

import UIKit
import AppLovinSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getAd(_ sender: Any) {
        // 広告が出せる状態か確認。
        print("Interstitial ad is available: ",ALInterstitialAd.isReadyForDisplay())
        // 0.5秒後に実行。ネット状態も考え、念のため。
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            if(ALInterstitialAd.isReadyForDisplay()){
                ALInterstitialAd.show()
            }else{
                
            }
        }
    }
    
}

