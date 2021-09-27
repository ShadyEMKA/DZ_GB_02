//
//  MainVC.swift
//  VK
//
//  Created by Андрей Шкундалёв on 20.09.21.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet private weak var logoView: UIView!
    @IBOutlet private weak var loginTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureScreen()
        addGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        subscribeToNotifications()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        unsubscribeFromNotification()
    }
    
    private func configureScreen() {
        
        self.logoView.layer.cornerRadius = 10
        self.loginButton.layer.cornerRadius = 5
        self.loginTF.placeholder = "Введите логин"
        self.passwordTF.placeholder = "Введите пароль"
        
        self.logoView.layer.shadowColor = UIColor.black.cgColor
        self.logoView.layer.shadowOffset = .zero
        self.logoView.layer.shadowRadius = 8
        self.logoView.layer.shadowOpacity = 0.8
    }
    
    private func addGesture() {

        let gesture = UITapGestureRecognizer(target: self, action: #selector(hadeKeyboard))
        self.scrollView.addGestureRecognizer(gesture)
    }

    @objc private func hadeKeyboard() {

        self.scrollView.endEditing(true)
    }
    
    private func subscribeToNotifications() {

        NotificationCenter.default.addObserver(self, selector: #selector(addScrolling), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(removeScroll), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func unsubscribeFromNotification() {

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    @objc private func addScrolling() {

        self.scrollView.contentInset.bottom = 120
    }

    @objc private func removeScroll() {

        self.scrollView.contentInset.bottom = 0
    }
    
    private func checkUserData() {
        
        if loginTF.text == "admin" && passwordTF.text == "root" {
            showMenu()
            loginTF.text = ""
            passwordTF.text = ""
        } else {
            showErrorData()
            loginTF.text = ""
            passwordTF.text = ""
        }
    }
    
    private func showMenu() {
        
        let storyaBoard = Constants.Storyboard.menu
        let vc = storyaBoard.instantiateInitialViewController()
        if let newVC = vc as? MenuTabBarVC {
            newVC.modalPresentationStyle = .fullScreen
            self.present(newVC, animated: true, completion: nil)
        }
    }
    
    private func showErrorData() {
        
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction private func pressedLogin(_ sender: UIButton) {
        
        checkUserData()
    }
    
}

