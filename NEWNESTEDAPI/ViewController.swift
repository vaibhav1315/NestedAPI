//
//  ViewController.swift
//  NEWNESTEDAPI
//
//  Created by Mac on 04/09/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var productcollectionview: UICollectionView!
    
    private let reuseidentifier = "ProductCollectionViewCell"
    
    var products = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterANXib()
        fetchData()
      
    }
    func RegisterANXib() {
         let uinib = UINib(nibName: reuseidentifier, bundle: nil)
        self.productcollectionview.register(uinib, forCellWithReuseIdentifier: reuseidentifier)
     
    }
    func fetchData() {
        let urlstring = "https://dummyjson.com/products"
        
        let url = URL(string: urlstring)
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        var datatask =  URLSession.shared.dataTask(with: urlRequest) { data,response ,error in
            print(error)
            print(response)
            
            var jsonresopnse = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
            
            let APIResponseproduct = jsonresopnse["products"] as! [[String:Any]]
            let APIResponseTotal = jsonresopnse["total"] as! Int
            let APIResponseskip = jsonresopnse["skip"] as! Int
            let APIResponseLimit = jsonresopnse["limit"] as! Int
            
            for eachproductobjet in APIResponseproduct {
                
                let APIResponseID = eachproductobjet["id"] as! Int
                let APIResopnseTitle =  eachproductobjet["title"] as! String
                let  APIResopnsediscration = eachproductobjet["description"] as! String
                let APIResponseprice = eachproductobjet["price"] as! Double
                let APIresponsediscountPercentage = eachproductobjet["discountPercentage"] as! Double
                let APIREsonserating = eachproductobjet["rating"] as! Double
                let apiresopnsestock = eachproductobjet["stock"] as! Int
                let apiresopncebrand = eachproductobjet["brand"] as! String
                let apiresponcecategory = eachproductobjet["category"] as! String
                let apiresoncethumbnail = eachproductobjet["thumbnail"] as! String
                let apiresopnceproductimage = eachproductobjet["images"] as! [String]
                
                let newproduct = Product(id: APIResponseID, title: APIResopnseTitle, description: APIResopnsediscration, price:APIResponseprice, discountPercentage: APIresponsediscountPercentage, rating: APIREsonserating, stock: apiresopnsestock, brand: apiresopncebrand, category: apiresponcecategory, thumbnail: apiresoncethumbnail, images: apiresopnceproductimage)
                
                self.products.append(newproduct)
                
            }
            DispatchQueue.main.async {
                self.productcollectionview.reloadData()
            }
        }
        datatask.resume()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let ProductCollectionViewCell = self.productcollectionview.dequeueReusableCell(withReuseIdentifier: reuseidentifier, for: indexPath) as! ProductCollectionViewCell
        
        let eachproductfetchfromarray = products[indexPath.item]
        
        ProductCollectionViewCell.productlabeltitle.text = eachproductfetchfromarray.title
        ProductCollectionViewCell.productlabelprice.text = String(eachproductfetchfromarray.price)
        
        let producthimbilstring = products[indexPath.item].thumbnail
        
        ProductCollectionViewCell.productimage.kf.setImage(with: URL(string: producthimbilstring))
        
        ProductCollectionViewCell.layer.borderColor = UIColor.black.cgColor
        ProductCollectionViewCell.layer.borderWidth = 0.5
  return ProductCollectionViewCell
    }
    
    
}
extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-6)/2
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        detailsviewcontroller.container = Product(id: products[indexPath.item].id.codingKey.intValue!,
                                                  title: products[indexPath.item].title,
                                                  description: products[indexPath.item].description,
                                                  price: products[indexPath.item].price,
                                                  discountPercentage: products[indexPath.item].discountPercentage,
                                                  rating: products[indexPath.item].rating,
                                                  stock: products[indexPath.item].stock.codingKey.intValue!,
                                                  brand: products[indexPath.item].brand,
                                                  category: products[indexPath.item].category,
                                                  thumbnail: products[indexPath.item].thumbnail,
                                                  images: products[indexPath.item].images)
        
        navigationController?.pushViewController(detailsviewcontroller, animated: true)
    }
    
}

