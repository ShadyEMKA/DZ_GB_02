//
//  FriendsTableVC.swift
//  VK
//
//  Created by Андрей Шкундалёв on 20.09.21.
//

import UIKit

class FriendsTableVC: UITableViewController {
    
    private var users = [User(name: "Конор Макгрегор", avatar: UIImage(named: "konor1"), allPhoto: [UIImage(named: "konor1"), UIImage(named: "konor2"), UIImage(named: "konor3")]),
                         User(name: "Марк Цукерберг", avatar: UIImage(named: "mark1"), allPhoto: [UIImage(named: "mark1")]),
                         User(name: "Тим Кук", avatar: UIImage(named: "tim1")!, allPhoto: [UIImage(named: "tim1"), UIImage(named: "tim2")]),
                         User(name: "Никола Тесла", avatar: UIImage(named: "tesla1"), allPhoto: [UIImage(named: "tesla1"), UIImage(named: "tesla2")]),
                         User(name: "Павел Дуров", avatar: UIImage(named: "durov1"), allPhoto: [UIImage(named: "durov1"), UIImage(named: "durov2")]),
                         User(name: "Иван Ургант", avatar: UIImage(named: "ivan1"), allPhoto: [UIImage(named: "ivan1"), UIImage(named: "ivan2")]),
                         User(name: "Илон Маск", avatar: UIImage(named: "mask1"), allPhoto: [UIImage(named: "mask1"), UIImage(named: "mask2"), UIImage(named: "mask3")])]
    
    private var sortedUsers: [Character: [User]]! {
        return sortedName(arrayUser: users)
    }
    
    private var litters: [Character]! {
        var keys: [Character] = []
        for i in sortedUsers.keys {
            keys.append(i)
        }
        let sortedKeys = keys.sorted { $0 < $1 }
        return sortedKeys
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return litters.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedUsers[litters[section]]!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.tableView.dequeueReusableCell(withIdentifier: Constants.Cell.friend, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let newVC = cell as? FriendsTableViewCell {
            let user = sortedUsers[litters[indexPath.section]]![indexPath.row]
            newVC.set(avatar: user.avatar, name: user.name)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = Constants.Storyboard.photoFriend
        let vc =  storyBoard.instantiateInitialViewController()
        if let newVC = vc as? PhotoFriendCollectionVC {
            newVC.friend = sortedUsers[litters[indexPath.section]]![indexPath.row]
            self.navigationController?.pushViewController(newVC, animated: true)
        }
    }
    
    private func sortedName(arrayUser: [User]) -> [Character: [User]]? {
        var newArray: [Character: [User]] = [:]
        for value in arrayUser {
            guard let index = value.name.first else { return nil}
            if newArray[index] == nil {
                newArray[index] = [value]
            } else {
                newArray[index]?.append(value)
            }
        }
        return newArray
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(litters[section])
    }
}
