//
//  ProfileViewController.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 8.09.21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonSettings()
        addImageProfile()
    }
    
    private func addButtonSettings() {
        let buttonSettings = UIBarButtonItem(image: .actions, style: .done, target: self, action: #selector(showSettings))
        self.navigationItem.rightBarButtonItem = buttonSettings
    }
    
    @objc private func showSettings() {
        let storyBoard = UIStoryboard(name: "Settings", bundle: nil)
        let vc = storyBoard.instantiateInitialViewController()
        if let vc = vc as? SettingsViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func addImageProfile() {
        self.imageProfile.image = UIImage(named: "vk")
    }
}
