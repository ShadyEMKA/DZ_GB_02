//
//  Group.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 13.09.21.
//

import UIKit

struct Group {
    let name: String
    let avatar: UIImage
}

var groups: [Group] = [Group(name: "GeekBrains", avatar: UIImage(named: "GB")!)]

var groupsSearch: [Group] = [Group(name: "VK", avatar: UIImage(named: "vk")!)]
