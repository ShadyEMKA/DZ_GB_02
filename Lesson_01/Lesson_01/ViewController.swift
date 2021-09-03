//
//  ViewController.swift
//  Lesson_01
//
//  Created by Андрей Шкундалёв on 2.09.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObeservers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.removeObservers()
    }
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollView.addGestureRecognizer(gesture)
    }
    
    @objc private func handleGesture() {
        self.scrollView.endEditing(true)
    }
    
    private func addObeservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc private func handleKeyboardWillShow() {
        self.scrollView.contentInset.bottom = 120
    }
    
    @objc private func handleKeyboardWillHide() {
        self.scrollView.contentInset.bottom = 0
    }
    
    @IBAction private func pressButtonOne(_ sender: UIButton) {
        let login = loginTextField.text
        let password = passwordTextField.text
        
        if login == "admin" && password == "root" {
            print("Авторизация администратора")
        } else {
            print("Обычная авторизация")
        }
    }
}

