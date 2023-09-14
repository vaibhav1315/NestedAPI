//
//  ProductCollectionViewCell.swift
//  NEWNESTEDAPI
//
//  Created by Mac on 04/09/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

   
  
    @IBOutlet weak var productimage: UIImageView!
    
    @IBOutlet weak var productlabeltitle: UILabel!
   
    @IBOutlet weak var productlabelprice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
