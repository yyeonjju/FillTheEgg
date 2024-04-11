//
//  ThirdOnboardingViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/10.
//

import UIKit

class ThirdOnboardingViewController: UIViewController {
    private let viewManager = ThirdOnboardingView()
    
    override func loadView() {
        view = viewManager
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .lightGray

    }

}
