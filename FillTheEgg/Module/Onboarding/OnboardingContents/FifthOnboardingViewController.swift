//
//  FifthOnboardingViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/10.
//

import UIKit

class FifthOnboardingViewController: UIViewController {
    private let viewManager = FifthOnboardingView()
    let timerManager = TimerManager.shared
    
    override func loadView() {
        view = viewManager
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .lightGray
        setupEvent()
        
    }
    
    private func setupEvent() {
        viewManager.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped() {
        UserDefaults.standard.isFirstLaunch = false
        changeRootView()
        timerManager.onboardingEggRateTimer.invalidate()
    }
    
    func changeRootView() {
        // 루트 뷰 컨트롤러 변경
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        sceneDelegate?.changeRootViewControllerToHome()
    }

}
