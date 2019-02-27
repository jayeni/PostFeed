//
//  ViewController.swift
//  PostFeed
//
//  Created by Jeremiah Ayeni on 2/23/19.
//  Copyright © 2019 Jeremiah Ayeni. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var postArr:[Post]?

        func parseJson(){
        
        self.postArr = [Post]()
        let url = URL(string: "https://api.myjson.com/bins/f8xry")!
        URLSession.shared.dataTask(with: url) { data , reposnse, error in
            guard data != nil else {return}
            do{
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                if let dictionary = json as? [String: Any] {
                    
                    if let dict = dictionary["posts"] as? [Any]
                    {
                        for i in 0..<dict.count {
                            let post = Post(json: dict[i] as! [String : Any])
                            self.postArr?.append(post)
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
                
            }catch{print(error)}
            }.resume()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      parseJson()
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    
        
        
      
    }
    
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArr?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "feed") as! FeedCell
        cell.setView(post: postArr![indexPath.row] )
        
        
        return cell
    }
    


}

