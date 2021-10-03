//
//  FriendsTableVC.swift
//  VK
//
//  Created by Андрей Шкундалёв on 20.09.21.
//

import UIKit

class FriendsTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var littersButton: LittersControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        littersButton = LittersControl(frame: CGRect(x: self.view.frame.size.width - 30,
                                                     y: 150,
                                                     width: 20,
                                                     height: self.view.frame.size.height / 2 + 100))
        self.view.addSubview(littersButton)
        littersButton.delegate = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return litters.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedUsers[litters[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.tableView.dequeueReusableCell(withIdentifier: Constants.Cell.friend, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let newVC = cell as? FriendsTableViewCell {
            let user = sortedUsers[litters[indexPath.section]]![indexPath.row]
            newVC.set(avatar: user.avatar, name: user.name)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = Constants.Storyboard.photoFriend
        let vc =  storyBoard.instantiateInitialViewController()
        if let newVC = vc as? PhotoFriendCollectionVC {
            newVC.friend = sortedUsers[litters[indexPath.section]]![indexPath.row]
            self.navigationController?.pushViewController(newVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(litters[section])
    }
    
    func scroll(index: Int) {
        tableView.scrollToRow(at: IndexPath(row: 0, section: index), at: .top, animated: true)
    }
}

extension FriendsTableVC: LittersDelegate {
    func pressed(index: Int) {
        let indexPath = IndexPath(row: 0, section: index)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
