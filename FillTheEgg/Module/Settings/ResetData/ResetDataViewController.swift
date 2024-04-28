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
        let confirmModalVC = ConfirmModalViewController()
        let confirmModalView = confirmModalVC.viewManager
        
        //VC
        confirmModalVC.delegate = self
        confirmModalVC.modalPresentationStyle = .overCurrentContext
        confirmModalVC.modalTransitionStyle = .crossDissolve
        
        //View
        confirmModalView.mainLabel.text = "초기화하시겠습니까?"
        confirmModalView.subLabel.text = "그동안 기록한 히스토리가 모두 삭제됩니다."
        confirmModalView.buttonsStackView.cancelButton.setTitle("아니오", for: .normal)
        confirmModalView.buttonsStackView.confirmButton.setTitle("초기화할게요", for: .normal)
        
        self.present(confirmModalVC, animated: true)
    }

}

extension ResetDataViewController : ConfirmModalVCDelegate{
    func confirmButtonTapped() {
        AttendanceCheckDataStore.shared.resetAllData()
        GratitudeJournalDataStore.shared.resetAllData()
        DailyGoalDataStore.shared.resetAllData()
        EggRateDataStore.shared.resetAllData()
        
        // 이전 화면으로 이동
        navigationController?.popViewController(animated: true)
    }
    
    
}
