//
//  User.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 12.09.21.
//

import UIKit

struct User {
    let name: String
    let city: String
    let avatar: UIImage
    let allPhoto: [UIImage]
}

var users: [User] = [User(name: "Конор Макгрегор", city: "Дублин", avatar: UIImage(named: "konor1")!, allPhoto: [UIImage(named: "konor1")!, UIImage(named: "konor2")!, UIImage(named: "konor3")!]),
                     User(name: "Макр Цукерберг", city: "Нью-Йорк", avatar: UIImage(named: "mark1")!, allPhoto: [UIImage(named: "mark1")!]),
                     User(name: "Тим Кук", city: "Алабама", avatar: UIImage(named: "tim1")!, allPhoto: [UIImage(named: "tim1")!, UIImage(named: "tim2")!]),
                     User(name: "Никола Тесла", city: "Смилян", avatar: UIImage(named: "tesla1")!, allPhoto: [UIImage(named: "tesla1")!, UIImage(named: "tesla2")!]),
                     User(name: "Павел Дуров", city: "Санкт-Петербург", avatar: UIImage(named: "durov1")!, allPhoto: [UIImage(named: "durov1")!, UIImage(named: "durov2")!]),
                     User(name: "Иван Ургант", city: "Санкт-Петербург", avatar: UIImage(named: "ivan1")!, allPhoto: [UIImage(named: "ivan1")!, UIImage(named: "ivan2")!]),
                     User(name: "Илон Маск", city: "Претория", avatar: UIImage(named: "mask1")!, allPhoto: [UIImage(named: "mask1")!, UIImage(named: "mask2")!, UIImage(named: "mask3")!])]

var myUser: [User] = [User(name: "Андрей Шкундалёв", city: "Минск", avatar: UIImage(named: "my")!, allPhoto: [UIImage(named: "my")!])]
