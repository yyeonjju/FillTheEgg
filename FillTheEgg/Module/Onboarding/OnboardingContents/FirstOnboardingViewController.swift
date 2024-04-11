//
//  FirstOnboardingViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/10.
//

import UIKit

final class FirstOnboardingViewController: UIViewController {
    private let viewManager = FirstOnboardingView()
    
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .lightGray
    }
    
    


}
