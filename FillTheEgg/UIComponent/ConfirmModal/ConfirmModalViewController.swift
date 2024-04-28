//
//  ConfirmModalViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/28.
//

import UIKit

protocol ConfirmModalVCDelegate: AnyObject {
    func confirmButtonTapped()
}


final class ConfirmModalViewController: UIViewController {
    let viewManager = ConfirmModalView()
    
    weak var delegate: ConfirmModalVCDelegate?
    
    // MARK: - lifecycle

    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEvent()

    }
    
    // MARK: - setupEvent

    private func setupEvent() {
        //배경화면 탭
        let backgroundTapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        viewManager.backgroundView.addGestureRecognizer(backgroundTapGesture)
        
        //취소 버튼 탭
        viewManager.buttonsStackView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        //확인 버튼 탭
        viewManager.buttonsStackView.confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }
    
    
    @objc private func backgroundTapped() {
        dismiss(animated: true)
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func confirmButtonTapped() {
        dismiss(animated: true)
        delegate?.confirmButtonTapped()
    }

}
