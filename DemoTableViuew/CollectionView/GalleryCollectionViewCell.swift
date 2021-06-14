//
//  GalleryCollectionViewCell.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 11/06/2021.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData(image: String?) {
        let image = UIImage.init(named: image ?? "")
        imgAvatar.image = image
    }
    
}
