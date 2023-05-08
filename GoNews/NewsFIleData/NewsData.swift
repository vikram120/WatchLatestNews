//
//  NewsData.swift
//  GoNews
//
//  Created by Vikram Kunwar on 01/05/23.
//

import Foundation

struct NewsData: Codable
{
    let status : String
    
    let articles: [ArticleData]
    
}
