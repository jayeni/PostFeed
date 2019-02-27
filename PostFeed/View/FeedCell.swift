//
//  FeedCell.swift
//  PostFeed
//
//  Created by Jeremiah Ayeni on 2/26/19.
//  Copyright © 2019 Jeremiah Ayeni. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var postView: UIImageView!
    @IBOutlet weak var usernameView: UILabel!
    @IBOutlet weak var likesView: UILabel!
    @IBOutlet weak var dateView: UILabel!
    @IBOutlet weak var descriptionView: UILabel!
    @IBAction func likeButton(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "like-on"){
            sender.setImage(UIImage(named: "like-off"), for: .normal)
        }
        else{
             sender.setImage(UIImage(named: "like-on"), for: .normal)
        }
        
    }
    
    
    func setView(post:Post) {
        super.layoutSubviews()
        setupImage(image: post.postURL ,pic: postView)
        setupImage(image: post.user?.avatarURL , pic: avatarView)
        
        avatarView.layer.cornerRadius = avatarView.bounds.width / 2
        avatarView.contentMode = .scaleAspectFill
        avatarView.clipsToBounds = true
        

        dateView.text = post.createdDate
        usernameView.text = post.user?.name
        descriptionView.text = post.descripTxt
        descriptionView.numberOfLines = 0
        
        likesView.text = String(post.likeCount!) + " likes"

        
    }
    
    
    func setupImage(image: String?,pic: UIImageView){
        if let imageurl = image{
            
            let url = URL(string: imageurl)
            
            URLSession.shared.dataTask(with: url!){ (data, response, error) in
                
                if error != nil {
                    return
                }
                DispatchQueue.main.async {
                    pic.image = UIImage(data: data!)
                }
                
                
                }.resume()
            
            
        }
    }
    
    
}
