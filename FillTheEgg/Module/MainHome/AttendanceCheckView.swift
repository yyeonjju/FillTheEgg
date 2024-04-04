//
//  AttendanceCheckView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit


final class AttendanceCheckView : UIView {
    
    var page : Page?
    
    // MARK: - Component
    let mainLabel = MainSectionLabel(text: "출석하기")
    
    let photoImageView : UIImageView = { //
        let view = UIImageView()
        view.backgroundColor = Assets.Colors.eggWhite.color
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill

        return view
    }()
    
    
    let photoLabel : UILabel = {
        let label = UILabel()

        let stringWithImage = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "photo")?.withRenderingMode(.alwaysTemplate)
        imageAttachment.image?.withTintColor(.white)
        let completeImageString = NSAttributedString(attachment: imageAttachment)
        stringWithImage.append(completeImageString)
        stringWithImage.append(NSAttributedString(string: "사진추가"))
        

        label.attributedText = stringWithImage
        label.font = FontFamily.Pretendard.extraBold.font(size: 15)
        label.textColor = .white
        
        return label
    }()
    
    let deletePhotoButton : ButtonWithOutLine = {
        let btn = ButtonWithOutLine(title: "", color: Assets.Colors.gray3.color, borderColor: Assets.Colors.gray3.color.cgColor)
        let trashImage = UIImage(systemName: "trash")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(trashImage, for: .normal)
        btn.tintColor = Assets.Colors.gray3.color
        btn.alpha = 0
        return btn
    }()
    
    
    
    // MARK: - Initial Method
    
    //    init(frame: CGRect, size : Size){}
    
    init(page : Page = .home) {
        super.init(frame: .zero)

        setupAutoLayout()
        self.page = page
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if page == .historyDetailView {
            self.deletePhotoButton.alpha = 0
        }
    }
    
    // MARK: - Event Method
    
    func setupAutoLayout () {
        
        [mainLabel, photoImageView, photoLabel, deletePhotoButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            
            mainLabel.topAnchor.constraint(equalTo: topAnchor),
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            deletePhotoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            deletePhotoButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            
            //photoView
            photoImageView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            photoImageView.widthAnchor.constraint(equalToConstant: Size.largePhotoImageWidth),
            photoImageView.heightAnchor.constraint(equalToConstant: Size.largePhotoImageWidth),
            photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            photoLabel.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor),
            photoLabel.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor)
            
            
        ])
        
    }
    
    
    
}

