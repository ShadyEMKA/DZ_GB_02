//
//  SettingsViewController.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 8.09.21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction private func aboutButton(_ sender: UIButton) {
       addAllert()
    }
    
    private func addAllert() {
        let allert = UIAlertController(title: "О программе", message: "Версия 0.1\nCreated by Андрей Шкундалёв", preferredStyle: .alert)
        let allertButton = UIAlertAction(title: "Ок", style: .default)
        allert.addAction(allertButton)
        self.present(allert, animated: true)
    }
}

