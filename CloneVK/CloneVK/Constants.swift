//
//  Constants.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 12.09.21.
//

import UIKit

enum Constants {
    
    enum Storyboard {
        static let menu: UIStoryboard = .init(name: "Menu", bundle: nil)
        static let profile: UIStoryboard = .init(name: "Profile", bundle: nil)
        static let settings: UIStoryboard = .init(name: "Settings", bundle: nil)
    }
    
    enum Cell {
        static let friend: String = "FriendCell"
        static let message: String = "MessageCell"
        static let friendCollection: String = "FriendCollectionCell"
        static let group: String = "GroupCell"
        static let groupSearch: String = "GroupSearchCell"
    }
}
