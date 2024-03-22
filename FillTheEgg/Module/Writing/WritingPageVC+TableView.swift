//
//  WritingPageVC+TableView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/22.
//

import UIKit

extension WritingPageViewController {
    
    func setupTableView() {
        viewManager.tableView.dataSource = self
        viewManager.tableView.delegate = self

        viewManager.tableView.register(BulletWithDeleteButtonTableViewCell.self, forCellReuseIdentifier: Cell.bulletWithDeleteButtonCell)
        
    }
    
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension WritingPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("✅numberOfRowsInSection", gratitudeJournalList.count)
        
//        if tableView == viewManager.tableView {
//            return gratitudeJournalList.count
//        }
//
//        if tableView == viewManager.dailyGoalsSection.bulletChckboxTableView {
//            return dailyGoalList.count
//        }
        
        tableView.isScrollEnabled = false
        return gratitudeJournalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("✅cellForRowAt")

//        if tableView == viewManager.gratitudeJournalSection.bulletTableView {
//            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletCell, for: indexPath) as! BulletTableViewCell
//            cell.label.text = gratitudeJournalList[indexPath.row].text
//            cell.selectionStyle = .none
//
//            return cell
//        }
//
//        if tableView == viewManager.dailyGoalsSection.bulletChckboxTableView {
//
//            print("✅cellForRowAt  dailyGoalsSection")
//            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletCheckboxCell, for: indexPath) as! BulletCheckboxTableViewCell
//            cell.label.text = dailyGoalList[indexPath.row].text
//            cell.ckeckbox.isChecked = dailyGoalList[indexPath.row].isDone
//            cell.selectionStyle = .none
//
//            return cell
//        }
//        return UITableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletWithDeleteButtonCell, for: indexPath) as! BulletWithDeleteButtonTableViewCell
        cell.label.text = gratitudeJournalList[indexPath.row].text
        cell.selectionStyle = .none
        
        return cell

    }
    

}


extension WritingPageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("✅didSelectRowAt")

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
