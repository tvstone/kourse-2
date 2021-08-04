//
//  NewsViewController.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 06.07.2021.
//

import UIKit

class NewsViewController: UIViewController {
   
    
    @IBOutlet var newsTableView: UITableView!
    
    let newsTableCellIdentifire = "newsTableCellIdentifire"
    var newsModel = NewsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.register(UINib(nibName: "NewsTableCell", bundle: nil), forCellReuseIdentifier: newsTableCellIdentifire)
        self.newsTableView.dataSource = self
        self.newsTableView.delegate = self
        newsTableView.reloadData()
    }
}

extension NewsViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModel.newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newsTableCellIdentifire, for: indexPath ) as? NewsTableCell else { return UITableViewCell()}
        cell.newsLabel.text = newsModel.newsArray[indexPath.row].titleNews
        cell.newsImage.image = newsModel.newsArray[indexPath.row].imageNews

        return cell
    }
    
    
    
}

