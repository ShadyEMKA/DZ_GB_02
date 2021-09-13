//
//  ProfileViewController.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 8.09.21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageProfile: UIImageView!
    @IBOutlet private weak var friendsLabel: UILabel!
    @IBOutlet private weak var groupsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonSettings()
        addImageProfile()
        self.friendsLabel.text = "\(users.count)"
        self.groupsLabel.text = "\(groups.count)"
    }
    
    private func addButtonSettings() {
        let buttonSettings = UIBarButtonItem(image: .actions, style: .done, target: self, action: #selector(showSettings))
        self.navigationItem.rightBarButtonItem = buttonSettings
    }
    
    @objc private func showSettings() {
        let storyBoard = Constants.Storyboard.settings
        let vc = storyBoard.instantiateInitialViewController()
        if let vc = vc as? SettingsViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func addImageProfile() {
        self.imageProfile.image = myUser[0].avatar
        self.nameLabel.text = myUser[0].name
    }
}
