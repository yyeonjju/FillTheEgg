//
//  ViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/12.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let viewManager = HomeView()
    let trackingTime = TrackingTime.shared
    let timerManager = TimerManager.shared
    let gratitudeJournalData = GratitudeJournalDataStore.shared
    let dailyGoalData = DailyGoalDataStore.shared
    let attendanceCheckData = AttendanceCheckDataStore.shared
    let dailyData = DailyDataStore.shared

    
    // MARK: - ViewController LifeCycle
    
    
    //뷰를 메모리에 올리는 과정에 실행
    override func loadView() {
        view = viewManager
    }

    //뷰가 생성되었을 때 한번만 호출
    override func viewDidLoad() {

        super.viewDidLoad()
        
        setupTableView() //테이블뷰 dataSource,delegate, cell 등록
        setupTimer()
        
        setupAddButtonEvent()
        
        setupImageViewTapGesture() //출석인증 사진 첨부하는 UIImageView에 탭 제스쳐 추가
        
//        print("🌸viewDidLoad", gratitudeJournalData.list())
//        gratitudeJournalData.resetAllData()
//        dailyGoalData.resetAllData()
//        attendanceCheckData.resetAllData()
    }
    
    //뷰가 화면에 나타날때마다 계속 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //tableView 리로드
        viewManager.gratitudeJournalSection.bulletTableView.reloadData()
        viewManager.dailyGoalsSection.bulletChckboxTableView.reloadData()
        
        //defaultView를 위한 데이터 재할당
        viewManager.gratitudeJournalSection.dataList = gratitudeJournalData.list()
        viewManager.dailyGoalsSection.dataList = dailyGoalData.list()
        
        //출석 체크 이미지 로딩
        if !attendanceCheckData.list().isEmpty {
            guard let imageData = attendanceCheckData.list()[0].imageData else {return}
            viewManager.attendCheckSection.photoImageView.image = UIImage(data: imageData)
            viewManager.attendCheckSection.photoLabel.alpha = 0
            viewManager.attendCheckSection.deletePhotoButton.alpha = 1
        }
        
        //알참지수 이미지와 동기부여 코멘트 업데이트
        updateEggRateImage()
        updateMotivationLabel()
    }


    
    // MARK: - Setup Method
    
    private func setupAddButtonEvent() {
        viewManager.gratitudeJournalSection.addButton.addTarget(self, action: #selector(gratitudeJournalAddButtonTapped), for: .touchUpInside)
        
        viewManager.dailyGoalsSection.addButton.addTarget(self, action: #selector(dailyGoalAddButtonTapped), for: .touchUpInside)
        
        viewManager.attendCheckSection.deletePhotoButton.addTarget(self, action: #selector(deletePhotoButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Event Method
    
    @objc func gratitudeJournalAddButtonTapped() {
        print("🌸🌸gratitudeJournalAddButtonTapped🌸🌸")
        
        let writingPageVC = WritingPageViewController()
        writingPageVC.hidesBottomBarWhenPushed = true
        writingPageVC.setupGratitudeJournalMode()
        
        navigationController?.pushViewController(writingPageVC, animated: true)
    }
    
    @objc func dailyGoalAddButtonTapped() {
        print("🌸🌸dailyGoalAddButtonTapped🌸🌸")
        
        let writingPageVC = WritingPageViewController()
        writingPageVC.hidesBottomBarWhenPushed = true
        writingPageVC.setupDailyGoalMode()
        
        navigationController?.pushViewController(writingPageVC, animated: true)
    }
    
    @objc func deletePhotoButtonTapped(){
        attendanceCheckData.resetAllData()
        resetAttendanceCheck()
    }
    
    func resetAttendanceCheck () {
        DispatchQueue.main.async { [weak self] in
            guard let self else{return}
            self.viewManager.attendCheckSection.photoLabel.alpha = 1
            self.viewManager.attendCheckSection.deletePhotoButton.alpha = 0
            self.viewManager.attendCheckSection.photoImageView.image = nil
        }
        
        //알참지수 이미지와 동기부여 코멘트 업데이트
        updateEggRateImage()
        updateMotivationLabel()
    }

    //알참지수 이미지 업데이트
    func updateEggRateImage () {
        let ratio = CGFloat(calculateEggRate())/100
        viewManager.eggRateImage.ratio = ratio
        
        //비율 업데이트될 때마다 DailyData도 업데이트해서 저장시켜주기
        updateDailyData(eggRate: ratio)
    }
    
    //동기부여 코멘트 업데이트
    func updateMotivationLabel () {
        let text = returnMotivationText()
        viewManager.motivationLabel.text = text
    }
    
    //DailyData 업데이트해서 저장
    func updateDailyData (eggRate : CGFloat) {
        dailyData.create(eggRate : eggRate)
    }
    
}

