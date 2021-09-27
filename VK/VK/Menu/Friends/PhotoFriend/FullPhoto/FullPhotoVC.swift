//
//  FullPhotoVC.swift
//  VK
//
//  Created by Андрей Шкундалёв on 22.09.21.
//

import UIKit

class FullPhotoVC: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = image
        self.imageView.contentMode = .scaleAspectFill
    }
    
    @IBAction private func pressedShare(_ sender: Any) {
        
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        present(shareController, animated: true, completion: nil)
    }
}
