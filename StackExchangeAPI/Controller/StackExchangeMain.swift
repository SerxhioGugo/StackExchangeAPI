//
//  StackExchangeMain.swift
//  StackExchangeAPI
//
//  Created by Serxhio Gugo on 10/16/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit
import SafariServices

class StackExchangeMain: UIViewController {

    let tableViewID = "TableViewID"
    var items = [Items]()
    private let path = "2.2/tags/swift/top-answerers/all_time?site=stackoverflow"
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.tableHeaderView = TableViewHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavController()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: tableViewID)
        fetchJSON()
    }
    
    fileprivate func fetchJSON() {
        Service.shared.stackExchangeUsers(path: path) { (jsonResponse, error) in
            if let error = error {
                print("Failed to fetch Users", error)
            }
            guard let items = jsonResponse?.items else { return }
            self.items = items
            self.tableView.reloadData()
          
        }
    }

    private func setupNavController() {
        view.backgroundColor = .white
        navigationItem.title = "Stack Exchange"
        navigationController?.navigationBar.barTintColor = UIColor.orange
        navigationController?.navigationBar.prefersLargeTitles = true
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    private func setupUI() {
        view.add(subview: tableView) { (v, p) in [
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor),
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor),
            ]}
    }

}
extension StackExchangeMain: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewID, for: indexPath) as! TableViewCell
        cell.dataSource = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stackOverflowURL = URL(string: (items[indexPath.row].user?.link)!)
        
        let safariVC = SFSafariViewController(url: stackOverflowURL!)
        safariVC.delegate = self as? SFSafariViewControllerDelegate
        safariVC.preferredBarTintColor = UIColor.orange
        safariVC.preferredControlTintColor = .white
        self.present(safariVC, animated: true, completion:  nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

