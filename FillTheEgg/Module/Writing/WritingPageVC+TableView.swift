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
    
    private func configureDeleteButton(_ cell : BulletWithDeleteButtonTableViewCell, index: Int) {
        
        cell.deleteCell = { [weak self] _ in
            guard let self else { return }
            
            if mode == .writeGratitudeJournal {
                gratitudeJournalList.remove(at: index)
            }
            if mode == .writeDailyGoal {
                dailyGoalList.remove(at: index)
            }
           
            viewManager.tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension WritingPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("✅numberOfRowsInSection", gratitudeJournalList.count)
        
        tableView.isScrollEnabled = false
        
        if mode == .writeGratitudeJournal {
            return gratitudeJournalList.count
        }

        if mode == .writeDailyGoal {
            return dailyGoalList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("✅cellForRowAt")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletWithDeleteButtonCell, for: indexPath) as! BulletWithDeleteButtonTableViewCell
        cell.selectionStyle = .none
        
        if mode == .writeGratitudeJournal {
            cell.label.text = gratitudeJournalList[indexPath.row].text
        }
        
        if mode == .writeDailyGoal {
            cell.label.text = dailyGoalList[indexPath.row].text
        }
        
        //셀 내부의 삭제(휴지통) 버튼 눌렀을 때 실행되는 작업 설정
        configureDeleteButton(cell, index : indexPath.row)
        
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
