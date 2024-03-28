//
//  HomeVC+PHPicker.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/20.
//

import UIKit
import PhotosUI


extension HomeViewController {
    
    func setupImageViewTapGesture() {
        // 1. create a gesture recognizer (tap gesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))

        // 2. add the gesture recognizer to a view
        viewManager.attendCheckSection.photoImageView.isUserInteractionEnabled = true
        viewManager.attendCheckSection.photoImageView.addGestureRecognizer(tapGesture)
    }
    
    
    // 3. this method is called when a tap is recognized
    @objc func handleTap(sender: UITapGestureRecognizer) {
//        print("image --- ", viewManager.attendCheckSection.photoImageView.image)
        
        // 이미지 피커 띄우기
        var pickerConfiguration = PHPickerConfiguration() //import PhotosUI
        pickerConfiguration.selectionLimit = 1
        pickerConfiguration.filter = .any(of: [.images])
        
        let picker = PHPickerViewController(configuration: pickerConfiguration)
        picker.delegate = self // PHPickerViewControllerDelegate 추가해서 메서드 만들어주기
        
        self.present(picker, animated: true)

    }
    
    
    
}

extension HomeViewController : PHPickerViewControllerDelegate {
    
    //이미지 피커를 닫을 때
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true) // 1
        
        let itemProvider = results.first?.itemProvider // 2
        
        if let itemProvider = itemProvider,
           
            //.UIImage로 캐스팅을 해서 넣어줘야
           itemProvider.canLoadObject(ofClass: UIImage.self) { // 3
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in // 4
                guard let self else { return }

                DispatchQueue.main.async {
                    //UI관련된 업데이트를 하고싶으면 꼭 main에서 돌려줘야한다.
                    self.viewManager.attendCheckSection.photoImageView.image = image as? UIImage // 5
                    self.viewManager.attendCheckSection.photoLabel.alpha = 0
                    self.viewManager.attendCheckSection.deletePhotoButton.alpha = 1
                }
                
                guard let image else { return }
                self.attendanceCheckData.create(image: image as! UIImage)
                
                DispatchQueue.main.async {
                    //알참지수 이미지와 동기부여 코멘트 업데이트
                    self.updateEggRateImage()
                    self.updateMotivationLabel()
                }

            }
        } else {
            // TODO: Handle empty results or item provider not being able load UIImage
            
        }
        
    }

}
