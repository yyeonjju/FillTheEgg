//
//  FirstOnboardingViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/10.
//

import UIKit

final class FirstOnboardingViewController: UIViewController {
    private let viewManager = FirstOnboardingView()
    let timerManager = TimerManager.shared
    var eggRate : Float = 0.0
    
    // MARK: - lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTimer()
    }
    
    // MARK: - method
    private func setupTimer() {
        timerManager.onboardingEggRateTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fillEgg), userInfo: nil, repeats: true)
    }
    
    @objc private func fillEgg () {
        if eggRate < 1.0 {
            eggRate += 0.1
        } else {
            eggRate = 0.1
        }
        
//        print("---fillEgg---", eggRate)
        viewManager.eggRateImage.ratio = convertFloatToCGFloat(eggRate)
    }


}
