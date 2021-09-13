//
//  ViewController.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 8.09.21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var loginText: UITextField!
    @IBOutlet private weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserver()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        removeObserver()
    }
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollView.addGestureRecognizer(gesture)
    }
    
    @objc private func handleGesture() {
        self.scrollView.endEditing(true)
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc private func handleKeyboardWillShow() {
        self.scrollView.contentInset.bottom = 120
    }
    
    @objc private func handleKeyboardWillHide() {
        self.scrollView.contentInset.bottom = 0
    }

    @IBAction private func pressButtonAuthorization(_ sender: UIButton) {
        checkUserData()
    }
    
    private func showError() {
        let allert = UIAlertController(title: "Ошибка", message: "Введены неверные данные", preferredStyle: .alert)
        let allertButton = UIAlertAction(title: "Ок", style: .default)
        allert.addAction(allertButton)
        self.present(allert, animated: true)
    }
    
    private func checkUserData() {
        let login = loginText.text
        let password = passwordText.text
        if login == "admin" && password == "root" {
            showMenu()
        } else {
            showError()
            loginText.text = ""
            passwordText.text = ""
        }
    }
    
    private func showMenu() {
        let storyBoard = Constants.Storyboard.menu
        let vc = storyBoard.instantiateInitialViewController()
        if let vc = vc as? MenuTabBarController {
            self.present(vc, animated: true)
        }
    }
    
}

