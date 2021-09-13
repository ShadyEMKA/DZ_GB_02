//
//  GroupSearchViewController.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 13.09.21.
//

import UIKit

class GroupSearchViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "GroupSearchTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.Cell.groupSearch)
    }
}

extension GroupSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Constants.Cell.groupSearch, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let group = cell as? GroupSearchTableViewCell {
            group.nameLabel.text = groupsSearch[indexPath.row].name
            group.avatarImage.image = groupsSearch[indexPath.row].avatar
        }
    }
}
