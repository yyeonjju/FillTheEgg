//
//  FifthOnboardingViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/10.
//

import UIKit

class FifthOnboardingViewController: UIViewController {
    private let viewManager = FifthOnboardingView()
    
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
        print("시작하기 버튼!!")
    }

}
