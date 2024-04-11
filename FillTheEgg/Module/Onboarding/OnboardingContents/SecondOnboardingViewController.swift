//
//  SecondOnboardingViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/10.
//

import UIKit

class SecondOnboardingViewController: UIViewController {
    private let viewManager = SecondOnboardingView()
    
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .lightGray
    }
    
}
