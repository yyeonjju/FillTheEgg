//
//  AttendanceCheckView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit


final class AttendanceCheckView : UIView {
    
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
    
    
    
    // MARK: - Initial Method
    
    //    init(frame: CGRect, size : Size){}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // setupBlockSize()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Event Method
    
    func setupAutoLayout () {
        
//        print("❤️❤️❤️❤️언제언제 불려 setupAutoLayout❤️❤️❤️")
        [mainLabel, photoImageView, photoLabel]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            
            mainLabel.topAnchor.constraint(equalTo: topAnchor),
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            //photoView
            photoImageView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            photoImageView.widthAnchor.constraint(equalToConstant: 150),
            photoImageView.heightAnchor.constraint(equalToConstant: 150),
            photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            photoLabel.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor),
            photoLabel.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor)
            
            
        ])
        
    }
    
    
    
}

