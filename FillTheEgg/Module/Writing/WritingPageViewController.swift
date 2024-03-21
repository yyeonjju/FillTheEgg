//
//  WritingPageViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/19.
//

import UIKit

class WritingPageViewController: UIViewController {
    
    let viewManager = WritingPageView()
    
    // MARK: - ViewController LifeCycle
    
    //뷰를 메모리에 올리는 과정에 실행
    override func loadView() {
        view = viewManager
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        setupAddTarget()
        
        hideKeyboardWhenTappedAround()
    }
    
    func setupDelegate() {
        viewManager.textFieldView.textField.delegate = self
    }
    
    func setupAddTarget() {
        // textFieldView - Tap Event
        //// UITextField가 탭됐을 떄 뿐만 아니라 textFieldView라는 UIView 어느 부분이 탭되어도 제스쳐 인식할 수 있도록
        let textFieldViewTap = UITapGestureRecognizer(target: self, action: #selector(textFieldViewTapped(sender:)))
        viewManager.textFieldView.addGestureRecognizer(textFieldViewTap)
        
        // textFieldView - EditingChanged Event
        ////shouldChangeCharactersIn에서 텍스트 카운트 업데이트 해주는 것보다  정확!!
        viewManager.textFieldView.textField
            .addTarget(self, action: #selector(taskLabelTextFieldChanged), for: .editingChanged)
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
