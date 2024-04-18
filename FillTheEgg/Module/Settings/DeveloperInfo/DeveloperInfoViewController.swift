//
//  DeveloperInfoViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/18.
//

import UIKit

final class DeveloperInfoViewController: UIViewController {
    private let viewManager = DeveloperInfoView()

    
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "개발자 정보"
        setupEvent()
    }
    
    // MARK: - setupEvent
    private func setupEvent() {
        let githupLabelTap = UITapGestureRecognizer(target: self, action: #selector(githubLinkTapped))
        viewManager.githubValue.addGestureRecognizer(githupLabelTap)
    }
    
    // MARK: - method
    @objc private func githubLinkTapped() {
        
        // 인터넷 창 열기
        guard let urlString = viewManager.githubValue.text,
              let url = URL(string: urlString) else { return }
        
        UIApplication.shared.open(url)
    }

    
    
}
