//
//  ArticleData.swift
//  GoNews
//
//  Created by Vikram Kunwar on 01/05/23.
//

import Foundation

struct ArticleData: Codable{
    
    
    let author:String?
    let title: String
    let urlToImage: String?
    let content: String?
}

