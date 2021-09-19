//
//  FriendCollectionViewController.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 13.09.21.
//

import UIKit

class FriendCollectionViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "FriendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.Cell.friendCollection)
    }
}

extension FriendCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users[id].allPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cell.friendCollection, for: indexPath)
    }
}

extension FriendCollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let user = cell as? FriendCollectionViewCell {
            user.imageFriend.image = users[id].allPhoto[indexPath.row]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 150
        let row: CGFloat = 3
        let inset: CGFloat = 5
        let totalInset = inset * 4
        let contentSize = self.collectionView.frame.width - totalInset
        let rowWidth = contentSize / row
        return .init(width: rowWidth, height: height)
    }
}
