//
//  UIImageView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit

class FilledEggImageView: UIImageView {
    
    enum EggImageMode {
        case withLabel
        case withoutLabel
        
    }
    
    // MARK: - Properties

    var ratio : CGFloat = 0.0 {
        didSet {
            DispatchQueue.main.async {[weak self] in
                guard let self else {return}
                self.changeFilledRatio(ratio: ratio)
            }

        }
    }
    
    var mode : EggImageMode?
    
    
    // MARK: - Initializer

    
    init(mode : EggImageMode = .withLabel) {
        super.init(frame: .zero)
        
        self.image = UIImage(named: Assets.Assets.filledEgg.name)?.withRenderingMode(.alwaysTemplate)
        self.tintColor = Assets.Colors.eggWhite.color
        self.mode = mode
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Method

    //UIImageView 위에 addSubView해서 일정 비율로 색이 채워질 수 있도록 하기 위한 메서드
    private func changeFilledRatio(ratio : CGFloat) {

        // 서브뷰로 추가되어 있던 뷰들을 삭제해주고 새롭게 색칠해줄 수 있도록
        self.subviews.forEach({
//            print("subviews ==> ", $0)
            $0.removeFromSuperview()
        })
        
        

        //1️⃣ "원본 이미지" 크기에서 일정비율로 이미지 자른다음
        
        //(frame:) 대신 (image: ) init으로 "원본 이미지" 가져오기
        let overlayView = UIImageView(image: UIImage(named: "filledEgg"))
        // 이미지 뷰의 프레임의 ratio만큼의 크기로 새로운 이미지를 그림 (overlayView는 원본 이미지 크기인 점 중요)
        //bounds.height의 * ratio 가 아니라 원본 이미지 크기인 overlayView.bounds.height의 * ratio
        let cropRect = CGRect(
            x: 0,
            //밑에서부터의 비율이 중요함으로 (원본 frame의 height - overlayView.bounds.height * ratio) 가 y축 기준이 되도록
            y: overlayView.frame.height - (overlayView.bounds.height * ratio),
            width: overlayView.bounds.width,
            height: overlayView.bounds.height * ratio
        )

        // 원본 이미지의 CGImage를 얻음
        guard let image = overlayView.image?.cgImage else {return}
        
        // 원본 이미지에서 절반을 잘라내어 새로운 이미지를 생성
        //ratio == 0.0 일 때는 croppedImage가 생성되지 않음. -> 그래도 얼리리턴되면 안되기 때문에 if let
        if let croppedImage = image.cropping(to: cropRect) {
            //2️⃣ 새로운 이미지로 overlayView를 업데이트
            overlayView.image = UIImage(cgImage: croppedImage).withRenderingMode(.alwaysTemplate)
            overlayView.tintColor = UIColor(named: "mainYellow")
            //원본 이미지의 크기가 아닌 self.bounds에 맞춘 크기로 조정
            overlayView.frame = CGRect(
                x: 0,
                //밑에서부터 원하는 비율만큼 위의 y축을 기준으로 그려야함
                y: bounds.height - (bounds.height * ratio),
                width: bounds.width,
                height: bounds.height * ratio
            )
            
            addSubview(overlayView)
        }

        
        let overlayLabel = UILabel()
        overlayLabel.text = "\(String(Int(ratio * 100)))%"
        overlayLabel.frame = (ratio >= 1.0 || ratio == 0.0)
        ? CGRect(
            x: 0,
            //밑에서부터 원하는 비율만큼 위의 y축을 기준으로 그려야함
            y: 0,
            width: bounds.width,
            height: bounds.height
        )
        : CGRect(
            x: 0,
            //밑에서부터 원하는 비율만큼 위의 y축을 기준으로 그려야함
            y: bounds.height - (bounds.height * ratio) - 10,
            width: bounds.width,
            height: 20
        )

        overlayLabel.textColor = Assets.Colors.white.color
        overlayLabel.textAlignment = .center
        overlayLabel.font = FontFamily.Pretendard.extraBold.font(size: 14)
        
        if mode == .withLabel {
            addSubview(overlayLabel)
        }
        
    }
}
