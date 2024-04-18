//
//  OpenSourceViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/18.
//

import UIKit

final class OpenSourceViewController: UIViewController {
    private let viewManager = OpenSourceView()
    private let openSourceData = OpenSourceDataStore()
    
    override func loadView() {
        view = viewManager
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "오픈소스"
        setupTableView()
    }
    
    private func setupTableView() {
        let tableView = viewManager.tableView
        tableView.register(OpenSourceTableViewCell.self, forCellReuseIdentifier: Cell.openSourceCell)
        tableView.dataSource = self
        tableView.delegate = self
    }

}

// MARK: - UITableView
extension OpenSourceViewController: UITableViewDataSource & UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return openSourceData.list().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.openSourceCell) as? OpenSourceTableViewCell else { return UITableViewCell() }
        let data = openSourceData.list()[indexPath.row]
        cell.label.text = data.name
        cell.lintLabel.text = data.url
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 셀 클릭 시, 바로 비활성화되는 애니메이션 추가
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 인터넷 창 열기
        guard let url = openSourceData.fetchURL(to: indexPath.row) else { return }
        
        UIApplication.shared.open(url)
    }
}
