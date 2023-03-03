//
//  ImageCell.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import UIKit

class ImageCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data: Data?) {
        DispatchQueue.main.async {
            if let `data` = data {
                self.imgView.image = UIImage(data: data)
            } else {
                self.imgView.image = nil
            }
        }
     
    }
}
