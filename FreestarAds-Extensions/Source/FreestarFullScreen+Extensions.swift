//
//  FreestarFullScreen+Extensions.swift
//  FreestarAds-Extensions
//
//  Created by Dean Chang on 4/1/20.
//  Copyright © 2020 Freestar. All rights reserved.
//

import Foundation
import UIKit
import FreestarAds

@objc
extension FreestarFullscreenAd {
    private var interstitialDelayInSeconds: Double { get { return 0.5 } }
    private var interstitialDelayFactor: Double { get { return 0.7 } }
    private var maxInterstitialRetry: Int { get { return 3 } }
    
    @objc
    public func present(from: UIViewController) {
        present(from: from, delay: interstitialDelayInSeconds, retryCount: maxInterstitialRetry)
    }
    
    private func present(from: UIViewController, delay: Double, retryCount: Int) {
        // bail if no more retries available
        if retryCount <= 0 { return }
        
        if from.viewIfLoaded?.window != nil {
            // attempt to show fullscreen ad
            self.show(from: from)
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) { [weak self] in
                // bail if self is nil
                guard let self = self else { return }
                self.present(from: from, delay: delay * self.interstitialDelayFactor, retryCount: retryCount - 1)
            }
        }
    }
}
