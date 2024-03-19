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


    }
    



}
