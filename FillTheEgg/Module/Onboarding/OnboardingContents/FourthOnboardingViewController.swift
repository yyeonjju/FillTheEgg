//
//  FourthOnboardingViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/10.
//

import UIKit

class FourthOnboardingViewController: UIViewController {
    private let viewManager = FourthOnboardingView()
    
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .lightGray
    }


}
