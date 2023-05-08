//
//  NewsContentHome.swift
//  GoNews
//
//  Created by Vikram Kunwar on 01/05/23.
//

import UIKit

class NewsContentHome: UIViewController {

    @IBOutlet weak var headlineLbl: UILabel!
    
    @IBOutlet weak var MynewsContent: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    
    var newsCo : ArticleData = ArticleData(author: "", title: "", urlToImage: "", content: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsImage.layer.cornerRadius = 10
        
        headlineLbl.text = newsCo.title
        if newsCo.urlToImage != nil
        {
            let url = URL(string: newsCo.urlToImage!)
            newsImage.downloadImage(from: url!)
            newsImage.contentMode = .scaleToFill
        }
        else
        {
            newsImage.image = UIImage(named: "emptyimage")
        }
        MynewsContent.text =  newsCo.content

    }
    


}
