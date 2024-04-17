//
//  SettingsViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/17.
//

import UIKit

final class SettingsViewController: UIViewController {
    let viewManager = SettingsView()
    let settingsDataManager = SettingsDataManager()
    
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    
    func setupTableView() {
        viewManager.tableView.dataSource = self
        viewManager.tableView.delegate = self

        viewManager.tableView.register(BasicTableViewCell.self, forCellReuseIdentifier: Cell.basicCell)
        
    }
    

}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension SettingsViewController: UITableViewDataSource {
    //섹션별 row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.isScrollEnabled = false
        
        if(section == 0) {
            return settingsDataManager.usageData().count
        } else if(section == 1) {
            return settingsDataManager.developerData().count
        }else{
            return 0
        }
    }
    
    //섹션별 헤더 제목
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "usage"
        }  else if(section == 1) {
            return "development"
        }else{
            return ""
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.basicCell, for: indexPath) as! BasicTableViewCell
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator // 우측 chevron 아이콘
        
        if indexPath.section == 0 {
            cell.label.text = settingsDataManager.usageData()[indexPath.row].name
        } else if indexPath.section == 1 {
            cell.label.text = settingsDataManager.developerData()[indexPath.row].name
        }

        return cell
    }
}


extension SettingsViewController: UITableViewDelegate{
    //섹셕 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("✅didSelectRowAt")
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

