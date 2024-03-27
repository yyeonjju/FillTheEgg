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
    
    private func configureCheckboxButton(cell : BulletCheckboxTableViewCell, index : Int) {
        
        cell.toggleCheckbox = {  [weak self] _ in
            guard let self else { return }
            
            self.dailyGoalData.update(isDone: cell.ckeckbox.isChecked, index: index)
            
        }
    }
}


// MARK: - UITableViewDataSource & UITableViewDelegate

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("✅numberOfRowsInSection", gratitudeJournalList.count)
        
        if tableView == viewManager.gratitudeJournalSection.bulletTableView {
            let gratitudeJournalList = gratitudeJournalData.list()
            return gratitudeJournalList.count
        }
        
        if tableView == viewManager.dailyGoalsSection.bulletChckboxTableView {
            let dailyGoalList = dailyGoalData.list()
            return dailyGoalList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("✅cellForRowAt")

        if tableView == viewManager.gratitudeJournalSection.bulletTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletCell, for: indexPath) as! BulletTableViewCell
            let gratitudeJournalList = gratitudeJournalData.list()
            
            cell.label.text = gratitudeJournalList[indexPath.row].text
            cell.selectionStyle = .none
            
            return cell
        }
        
        if tableView == viewManager.dailyGoalsSection.bulletChckboxTableView {
            
//            print("✅cellForRowAt  dailyGoalsSection")
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletCheckboxCell, for: indexPath) as! BulletCheckboxTableViewCell
            let dailyGoalList = dailyGoalData.list()
            
            cell.label.text = dailyGoalList[indexPath.row].text
            cell.ckeckbox.isChecked = dailyGoalList[indexPath.row].isDone
            cell.selectionStyle = .none
            
            //셀 내부의 체크박스 버튼 눌렀을 때 실행되는 작업 설정
            configureCheckboxButton(cell: cell, index: indexPath.row)
            
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
