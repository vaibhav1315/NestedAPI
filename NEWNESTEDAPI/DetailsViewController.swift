//
//  DetailsViewController.swift
//  NEWNESTEDAPI
//
//  Created by Mac on 10/09/23.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var productIdlabel: UILabel!
    
    @IBOutlet weak var producttitlelabel: UILabel!
    
    
    @IBOutlet weak var productdiscrepationlabel: UILabel!
    
    
    @IBOutlet weak var pricelabel: UILabel!
    
    
    @IBOutlet weak var productdicountlabel: UILabel!
    
    
    @IBOutlet weak var productratinglabel: UILabel!
    
    
    @IBOutlet weak var productstocklabel: UILabel!
    
    
    @IBOutlet weak var productbrandlabel: UILabel!
   
    
    @IBOutlet weak var productcatagorylabel: UILabel!
    
    var container : Product?

    override func viewDidLoad() {
        super.viewDidLoad()
databinding()
       
    }
    
    func databinding() {
        
        productIdlabel.text = container?.id.codingKey.stringValue
        productdiscrepationlabel.text = container?.description
        productcatagorylabel.text = container?.category
        productbrandlabel.text = container?.brand
        productstocklabel.text = container?.stock.codingKey.stringValue
        productdicountlabel.text = container?.stock.codingKey.stringValue
        pricelabel.text = container?.price.sign.rawValue.codingKey.stringValue
        producttitlelabel.text = container?.title.codingKey.stringValue
        productratinglabel.text = container?.rating.sign.rawValue.codingKey.stringValue
    }
  

}
