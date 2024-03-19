//
//  HomeVC+TableView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/19.
//

import UIKit

extension HomeViewController {
    
    func setupTableView() {
        viewManager.gratitudeJournalSection.bulletTableView.dataSource = self
        viewManager.gratitudeJournalSection.bulletTableView.delegate = self
//        viewManager.bulletTableView.rowHeight = 40
        viewManager.gratitudeJournalSection.bulletTableView.register(BulletTableViewCell.self, forCellReuseIdentifier: Cell.bulletCell)
        
        viewManager.dailyGoalsSection.bulletChckboxTableView.dataSource = self
        viewManager.dailyGoalsSection.bulletChckboxTableView.delegate = self
        viewManager.dailyGoalsSection.bulletChckboxTableView.register(BulletCheckboxTableViewCell.self, forCellReuseIdentifier: Cell.bulletCheckboxCell)
    }
    
}


// MARK: - UITableViewDataSource & UITableViewDelegate

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("✅numberOfRowsInSection", gratitudeJournalList.count)
        
        if tableView == viewManager.gratitudeJournalSection.bulletTableView {
            return gratitudeJournalList.count
        }
        
        if tableView == viewManager.dailyGoalsSection.bulletChckboxTableView {
            return dailyGoalList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("✅cellForRowAt")

        if tableView == viewManager.gratitudeJournalSection.bulletTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletCell, for: indexPath) as! BulletTableViewCell
            cell.label.text = gratitudeJournalList[indexPath.row].text
            cell.selectionStyle = .none
            
            return cell
        }
        
        if tableView == viewManager.dailyGoalsSection.bulletChckboxTableView {
            
            print("✅cellForRowAt  dailyGoalsSection")
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletCheckboxCell, for: indexPath) as! BulletCheckboxTableViewCell
            cell.label.text = dailyGoalList[indexPath.row].text
            cell.ckeckbox.isChecked = dailyGoalList[indexPath.row].isDone
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()

    }
    

}


extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("✅didSelectRowAt")

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
