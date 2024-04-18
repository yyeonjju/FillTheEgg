//
//  ResetDataViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/18.
//

import UIKit

final class ResetDataViewController: UIViewController {
    private let viewManager = ResetDataView()

    
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "데이터 초기화"
        setupEvent()
    }
    
    
    // MARK: - setupEvent
    
    private func setupEvent() {
        viewManager.deleteDataButton.addTarget(self, action: #selector(deleteDataButtonTapped), for: .touchUpInside)
    }

    // MARK: - method
    @objc private func deleteDataButtonTapped() {
        
    }

}
