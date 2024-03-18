//
//  CheckBox.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/18.
//

import UIKit

/// 체크박스
class CheckBoxButton: UIButton {
    
    class OnOffResources {

        let onImage: UIImage?
        let offImage: UIImage?

        init(onImage: UIImage?, offImage: UIImage?) {
            self.onImage = onImage
            self.offImage = offImage
        }
    }
    
    
    // MARK: - Properties

    
    let ImageConfig = UIImage.SymbolConfiguration(pointSize: 25)

    /// 체크박스 이미지
    lazy var checkBoxResouces = OnOffResources(
        onImage: UIImage(systemName: "checkmark.square.fill", withConfiguration: ImageConfig),
        offImage: UIImage(systemName: "square", withConfiguration: ImageConfig)
    ) {
        didSet {
            self.setChecked(isChecked)
        }
    }

    /// 체크 상태 변경
    var isChecked: Bool = false {
        didSet {
            guard isChecked != oldValue else { return }
            self.setChecked(isChecked)
        }
    }

    // MARK: - init

    /// 이미지 직접 지정 + init
    init(resources: OnOffResources) {
        super.init(frame: .zero)
        self.checkBoxResouces = resources
        commonInit()
    }

    /// 일반적인 init + checkBoxResources 변경
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    // MARK: - method

    //모든 생성자에 공통으로 적용되는 것
    private func commonInit() {
        self.setImage(checkBoxResouces.offImage, for: .normal)

        self.addTarget(self, action: #selector(check), for: .touchUpInside)
        self.tintColor = Assets.Colors.normalGreen.color
//        self.isChecked = isDone

    }

    //isChecked 프로퍼티의 Bool 값 전환
    @objc func check(_ sender: UIGestureRecognizer) {
        isChecked.toggle()
    }

    /// 이미지 변경
    private func setChecked(_ isChecked: Bool) {
        if isChecked == true {
            self.setImage(checkBoxResouces.onImage, for: .normal)
        } else {
            self.setImage(checkBoxResouces.offImage, for: .normal)
        }
    }


}
