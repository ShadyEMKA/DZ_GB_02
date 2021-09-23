//
//  FriendsTableVC.swift
//  VK
//
//  Created by Андрей Шкундалёв on 20.09.21.
//

import UIKit

class FriendsTableVC: UITableViewController {
    
    var users = [User(name: "Конор Макгрегор", avatar: UIImage(named: "konor1"), allPhoto: [UIImage(named: "konor1"), UIImage(named: "konor2"), UIImage(named: "konor3")]),
                 User(name: "Макр Цукерберг", avatar: UIImage(named: "mark1"), allPhoto: [UIImage(named: "mark1")]),
                 User(name: "Тим Кук", avatar: UIImage(named: "tim1")!, allPhoto: [UIImage(named: "tim1"), UIImage(named: "tim2")]),
                 User(name: "Никола Тесла", avatar: UIImage(named: "tesla1"), allPhoto: [UIImage(named: "tesla1"), UIImage(named: "tesla2")]),
                 User(name: "Павел Дуров", avatar: UIImage(named: "durov1"), allPhoto: [UIImage(named: "durov1"), UIImage(named: "durov2")]),
                 User(name: "Иван Ургант", avatar: UIImage(named: "ivan1"), allPhoto: [UIImage(named: "ivan1"), UIImage(named: "ivan2")]),
                 User(name: "Илон Маск", avatar: UIImage(named: "mask1"), allPhoto: [UIImage(named: "mask1"), UIImage(named: "mask2"), UIImage(named: "mask3")])]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        self.navigationController?.navigationBar.tintColor = .black
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return self.tableView.dequeueReusableCell(withIdentifier: Constants.Cell.friend, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let newVC = cell as? FriendsTableViewCell {
            let user = users[indexPath.row]
            newVC.set(avatar: user.avatar, name: user.name)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = Constants.Storyboard.photoFriend
        let vc =  storyBoard.instantiateInitialViewController()
        if let newVC = vc as? PhotoFriendCollectionVC {
            newVC.friend = users[indexPath.row]
            self.navigationController?.pushViewController(newVC, animated: true)
        }
    }
}
