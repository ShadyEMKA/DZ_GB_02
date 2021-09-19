//
//  LikeView.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 18.09.21.
//

import UIKit

class LikeView: UIControl {

    private weak var button: UIButton!
    private weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let button = UIButton(frame: CGRect(x: 30, y: 0, width: 30, height: 30))
        let image = UIImage(named: "like")
        let newImage = image?.withRenderingMode(.alwaysTemplate)
        button.setImage(newImage, for: .normal)
        button.tintColor = .white
        self.addSubview(button)
        self.button = button
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        label.textAlignment = .center
        label.textColor = .white
        label.text = "0"
        self.addSubview(label)
        self.label = label
        
        button.addTarget(self, action: #selector(colorForButton), for: .touchUpInside)
        self.backgroundColor = .clear
    }
    
    @objc func colorForButton() {
        if self.button.tintColor == UIColor.white {
            self.button.tintColor = .red
            self.label.text = "1"
            self.label.textColor = .red
        } else if self.button.tintColor == UIColor.red {
            self.button.tintColor = .white
            self.label.text = "0"
            self.label.textColor = .white
        }
    }
}
