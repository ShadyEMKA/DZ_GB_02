//
//  GroupViewController.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 13.09.21.
//

import UIKit

class GroupViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.Cell.group)
    }
    
    @IBAction private func searchGroup(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "GroupSearch", bundle: nil)
        let vc = storyBoard.instantiateInitialViewController()
        if let vc = vc as? GroupSearchViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension GroupViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Constants.Cell.group, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let group = cell as? GroupTableViewCell {
            group.nameLabel.text = groups[indexPath.row].name
            group.avatarImage.image = groups[indexPath.row].avatar
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            groupsSearch.append(groups.remove(at: indexPath.row))
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        default:
            break
        }
    }
}
