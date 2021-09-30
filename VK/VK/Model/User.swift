//
//  User.swift
//  VK
//
//  Created by Андрей Шкундалёв on 22.09.21.
//

import UIKit

struct User {
    let name: String
    let avatar: UIImage?
    let allPhoto: [UIImage?]
}

var users = [User(name: "Аонор Макгрегор", avatar: UIImage(named: "konor1"), allPhoto: [UIImage(named: "konor1"), UIImage(named: "konor2"), UIImage(named: "konor3")]),
                    User(name: "Барк Цукерберг", avatar: UIImage(named: "mark1"), allPhoto: [UIImage(named: "mark1")]),
                    User(name: "Вим Кук", avatar: UIImage(named: "tim1")!, allPhoto: [UIImage(named: "tim1"), UIImage(named: "tim2")]),
                    User(name: "Гикола Тесла", avatar: UIImage(named: "tesla1"), allPhoto: [UIImage(named: "tesla1"), UIImage(named: "tesla2")]),
                    User(name: "Давел Дуров", avatar: UIImage(named: "durov1"), allPhoto: [UIImage(named: "durov1"), UIImage(named: "durov2")]),
                    User(name: "Еван Ургант", avatar: UIImage(named: "ivan1"), allPhoto: [UIImage(named: "ivan1"), UIImage(named: "ivan2")]),
                    User(name: "Жлон Маск", avatar: UIImage(named: "mask1"), allPhoto: [UIImage(named: "mask1"), UIImage(named: "mask2"), UIImage(named: "mask3")]),
                    User(name: "Зонор Макгрегор", avatar: UIImage(named: "konor1"), allPhoto: [UIImage(named: "konor1"), UIImage(named: "konor2"), UIImage(named: "konor3")]),
                    User(name: "Иарк Цукерберг", avatar: UIImage(named: "mark1"), allPhoto: [UIImage(named: "mark1")]),
                    User(name: "Ким Кук", avatar: UIImage(named: "tim1")!, allPhoto: [UIImage(named: "tim1"), UIImage(named: "tim2")]),
                    User(name: "Ликола Тесла", avatar: UIImage(named: "tesla1"), allPhoto: [UIImage(named: "tesla1"), UIImage(named: "tesla2")]),
                    User(name: "Мавел Дуров", avatar: UIImage(named: "durov1"), allPhoto: [UIImage(named: "durov1"), UIImage(named: "durov2")]),
                    User(name: "Нван Ургант", avatar: UIImage(named: "ivan1"), allPhoto: [UIImage(named: "ivan1"), UIImage(named: "ivan2")]),
                    User(name: "Олон Маск", avatar: UIImage(named: "mask1"), allPhoto: [UIImage(named: "mask1"), UIImage(named: "mask2"), UIImage(named: "mask3")]),
                    User(name: "Понор Макгрегор", avatar: UIImage(named: "konor1"), allPhoto: [UIImage(named: "konor1"), UIImage(named: "konor2"), UIImage(named: "konor3")]),
                    User(name: "Рарк Цукерберг", avatar: UIImage(named: "mark1"), allPhoto: [UIImage(named: "mark1")]),
                    User(name: "Сим Кук", avatar: UIImage(named: "tim1")!, allPhoto: [UIImage(named: "tim1"), UIImage(named: "tim2")]),
                    User(name: "Тикола Тесла", avatar: UIImage(named: "tesla1"), allPhoto: [UIImage(named: "tesla1"), UIImage(named: "tesla2")]),
                    User(name: "Павел Дуров", avatar: UIImage(named: "durov1"), allPhoto: [UIImage(named: "durov1"), UIImage(named: "durov2")]),
                    User(name: "Иван Ургант", avatar: UIImage(named: "ivan1"), allPhoto: [UIImage(named: "ivan1"), UIImage(named: "ivan2")]),
                    User(name: "Илон Маск", avatar: UIImage(named: "mask1"), allPhoto: [UIImage(named: "mask1"), UIImage(named: "mask2"), UIImage(named: "mask3")])
]

var sortedUsers: [Character: [User]]! {
    return sortedName(arrayUser: users)
}

var litters: [Character]! {
    var keys: [Character] = []
    for i in sortedUsers.keys {
        keys.append(i)
    }
    let sortedKeys = keys.sorted { $0 < $1 }
    return sortedKeys
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
