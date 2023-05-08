//
//  MyNewsFIle.swift
//  GoNews
//
//  Created by Vikram Kunwar on 01/05/23.
//

import UIKit

class MyNewsFIle: UITableViewCell {

    @IBOutlet weak var headlineImage: UIImageView!
    
    
    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var authorName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headlineImage.image = nil
    }

}
