//
//  GroupTableVC.swift
//  VK
//
//  Created by Андрей Шкундалёв on 20.09.21.
//

import UIKit

class GroupTableVC: UITableViewController {
    
    var group: [Group] = [Group(name: "GeekBrains", avatar: UIImage(named: "GB"))]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        addButtonSearch()
        configure()
    }
    
    private func configure() {
        self.navigationController?.navigationBar.tintColor = .black
    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return group.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(withIdentifier: Constants.Cell.group, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let newVC = cell as? GroupTableViewCell {
            let group = group[indexPath.row]
            newVC.set(avatar: group.avatar, name: group.name)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            group.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        default:
            break
        }
    }
    
    private func addButtonSearch() {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .done, target: self, action: #selector(pressedSearch))
        button.tintColor = .black
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc private func pressedSearch() {
        let storyBoard = Constants.Storyboard.searchGroup
        let vc = storyBoard.instantiateInitialViewController()
        if let newVC = vc as? SearchGroupTableVC {
            newVC.title = "Поиск"
            self.navigationController?.pushViewController(newVC, animated: true)
        }
    }
}
