//
//  WritingPageViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/19.
//

import UIKit

class WritingPageViewController: UIViewController {
    
    enum Mode {
        case writeGratitudeJournal
        case writeDailyGoal
    }
    
    let viewManager = WritingPageView()
    let gratitudeJournalData = GratitudeJournalDataStore.shared
    
    var mode: Mode = .writeGratitudeJournal {
        didSet {
            if mode == .writeGratitudeJournal {
                title = "감사 일기"

            }
            
            if mode == .writeDailyGoal {
                title = "오전 목표"

            }
        }
    }

    // MARK: - ViewController LifeCycle
    
    //뷰를 메모리에 올리는 과정에 실행
    override func loadView() {
        view = viewManager
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        setupAddTarget()
        setupButtonEvent()
        
        hideKeyboardWhenTappedAround()
        
        setupTableView() //테이블뷰 dataSource,delegate, cell 등록
        print("🌸WritingPageViewController - viewDidLoad")
    }
    
    //뷰가 화면에 나타날때마다 계속 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        //tableView 리로드
        viewManager.tableView.reloadData()
    }
    
    // MARK: - Setup Method
    
    func setupGratitudeJournalMode() {
        mode = .writeGratitudeJournal
        viewManager.textFieldView.textField.placeholder = "감사일기 작성이야~~"

    }
    func setupDailyGoalMode() {
        mode = .writeDailyGoal
        viewManager.textFieldView.textField.placeholder = "오전 목표 작성이야~~"
    }
    
    private func setupButtonEvent() {
        //addButton
        viewManager.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        //registerButton
//        viewManager.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private func setupDelegate() {
        viewManager.textFieldView.textField.delegate = self
    }
    
    private func setupAddTarget() {
        // textFieldView - Tap Event
        //// UITextField가 탭됐을 떄 뿐만 아니라 textFieldView라는 UIView 어느 부분이 탭되어도 제스쳐 인식할 수 있도록
        let textFieldViewTap = UITapGestureRecognizer(target: self, action: #selector(textFieldViewTapped(sender:)))
        viewManager.textFieldView.addGestureRecognizer(textFieldViewTap)
        
        // textFieldView - EditingChanged Event
        ////shouldChangeCharactersIn에서 텍스트 카운트 업데이트 해주는 것보다  정확!!
        viewManager.textFieldView.textField
            .addTarget(self, action: #selector(taskLabelTextFieldChanged), for: .editingChanged)
    }
    
    // MARK: - Event Method
    
    @objc func addButtonTapped() {
        
        guard let text = viewManager.textFieldView.textField.text else {return }

        if text.isEmpty{
            viewManager.textFieldView.warningLabel.text = "텍스트를 입력해주세요."
            viewManager.textFieldView.isWarningLabelEnabled(true)

        } else {
            switch mode {
            case .writeGratitudeJournal :
                gratitudeJournalData.create(text: text)
            case .writeDailyGoal :
                dailyGoalList.append(Goal(id: dailyGoalList.count, text: text, isDone: false))
            }

            ////데이터 업데이트하고 다시 테이블뷰 리로드
            viewManager.tableView.reloadData()
            ////텍스트필드 & 글자수 초기화
            viewManager.textFieldView.textField.text = ""
            self.viewManager.textFieldView.countLabel.text = "0/\(textFieldMaxCount)"
        }
        
//        gratitudeJournalData.create(text: "하하하하")
////        viewManager.tableView.reloadData()
//        print("코어데이터 Read -> ",gratitudeJournalData.list())
        
    }
    
    @objc func registerButtonTapped() {
        print("작성된 감사일기 저장하기")
    }
    
    /// FieldForm 전체 영역 선택 가능
    @objc func textFieldViewTapped(sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            self.viewManager.textFieldView.textField.becomeFirstResponder()
        }
    }
    
    @objc func taskLabelTextFieldChanged() {
        guard let text = viewManager.textFieldView.textField.text else { return }
        
        DispatchQueue.main.async {
            if text.isEmpty {
                self.viewManager.textFieldView.warningLabel.text = "텍스트를 입력해주세요."
                self.viewManager.textFieldView.isWarningLabelEnabled(true)
            }else {
                self.viewManager.textFieldView.warningLabel.text = ""
                self.viewManager.textFieldView.isWarningLabelEnabled(false)
            }
            
            // 글자수 현황 업데이트
            self.viewManager.textFieldView.countLabel.text = "\(text.count)/\(textFieldMaxCount)"
        }
    }
        



}

// MARK: - UITextFieldDelegate
extension WritingPageViewController: UITextFieldDelegate {
    
    
    // 텍스트필드에 글자내용이 (한글자 한글자) 입력되거나 지워질때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        /// 최대 글자수
        let maxString = textFieldMaxCount
        
        /// 작성한 글자
        guard let text = textField.text else { return false }
        
        /// Backspace 감지
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {return true}
        }
                
        /// 최대 글자수 제한
        if (text.count+1) > maxString {return false}
        
        else { return true }
    }
    
    // 텍스트필드의 엔터키가 눌러졌을때 호출 (동작할지 말지 물어보는 것)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        addButtonTapped()
        return true
    }
    
    // 텍스트필드의 입력이 끝날때 호출 (끝낼지 말지를 물어보는 것)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        
        // 실제 텍스트필드에 아무것도 입력이 되어 있지 않으면, 입력을 끝내지 못하게
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
        //return true
    }
    
}
