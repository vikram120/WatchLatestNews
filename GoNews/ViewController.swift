//
//  ViewController.swift
//  GoNews
//
//  Created by Vikram Kunwar on 01/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var articleList = [ArticleData]()
    
    

    @IBOutlet weak var newsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNewsData()
        
    }
    
    func fetchNewsData(){
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2023-04-30&to=2023-04-30&sortBy=popularity&apiKey=c45b7ab7d8e74db18596153b9b53e861")
        
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response ,error) in
            
            guard let data = data ,error == nil else
            {
                print("Error Occured while accessing Data from URL")
                return
                
            }
            var fullNewsList: NewsData?
            do
            {
                fullNewsList = try JSONDecoder().decode(NewsData.self, from: data)
            }
            catch
            {
                
                print("Error Occured while decoding Json data into Swift Structure \(error)")
                
            }
            self.articleList = fullNewsList!.articles
            
            DispatchQueue.main.async {
                self.newsTable.reloadData()
            }
            
            
            
        })
        dataTask.resume()
        
        
    }


}
extension UIImageView

{
    func downloadImage(from url: URL)
    
    {
        
        contentMode = .scaleToFill
        
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: {
            (data,response,error) in
            
            guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200,
                  let mimType = response?.mimeType , mimType.hasPrefix("image"),
                  let data = data, error  == nil,
                      let image = UIImage(data: data)
                      else
                  {
                         return
                    }
            DispatchQueue.main.async {
                self.image = image
            }
                      
            
        })
        dataTask.resume()
    }
    
}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTable.dequeueReusableCell(withIdentifier: "newscell", for: indexPath) as! MyNewsFIle
        if articleList[indexPath.row].author != nil
        {
            cell.authorName.text = "Author :\(articleList[indexPath.row].author!)"
        }
        else
        {
            cell.authorName.text = "No Author Available"
        }
        cell.newsTitle.text = articleList[indexPath.row].title
        if articleList[indexPath.row].urlToImage != nil
        {
            let url = URL(string: articleList[indexPath.row].urlToImage!)
            cell.headlineImage.downloadImage(from: url!)
            cell.headlineImage.contentMode = .scaleToFill
            cell.headlineImage.layer.cornerRadius = 10
            
        }
        else
        {
            cell.headlineImage.image = UIImage(named: "emptyimage")
            
        }
        
        return cell
            
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "NewsContentHome") as? NewsContentHome
        vc?.newsCo = articleList[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
}

