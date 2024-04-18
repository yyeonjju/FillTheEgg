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
    //섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0 :
            if indexPath.row == 0 {
                resetAllDataCellTapped()
            }
        case 1:
            if indexPath.row == 0 {
                developerInfoCellTapped()
            } else if indexPath.row == 1 {
                openSourceCellTapped()
            }
            
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


// MARK: - Cell Touch Event Method
extension SettingsViewController {
    /// 초기화 셀 클릭 시 호출되는 메서드.
    func resetAllDataCellTapped() {
        let resetVC = ResetDataViewController()
//        resetVC.delegate = self
        resetVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(resetVC, animated: true)
    }
    
    /// 개발자 정보 셀 클릭 시 호출되는 메서드
    func developerInfoCellTapped() {
        let developerVC = DeveloperInfoViewController()
        developerVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(developerVC, animated: true)
    }
    
    /// 오픈소스 셀 클릭 시 호출되는 메서드
    func openSourceCellTapped() {
        let openSourceVC = OpenSourceViewController()
        openSourceVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(openSourceVC, animated: true)
    }
    
    
}

