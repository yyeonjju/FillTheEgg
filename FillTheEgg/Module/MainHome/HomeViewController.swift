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
        setupEvent()

    }
    
    //뷰가 화면에 나타날때마다 계속 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewManager.gratitudeJournalSection.bulletTableView.reloadData()
        viewManager.dailyGoalsSection.bulletChckboxTableView.reloadData()
        
    }


    
    // MARK: - Setup Method
    private func setupEvent() {
        viewManager.gratitudeJournalSection.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Event Method
    @objc func addButtonTapped() {
        print("🌸🌸addButtonTapped🌸🌸")
    }
    
    
}

