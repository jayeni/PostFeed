//
//  Feedv2Cell.swift
//  PostFeed
//
//  Created by Jeremiah Ayeni on 2/28/19.
//  Copyright © 2019 Jeremiah Ayeni. All rights reserved.
//

import UIKit

class FeedCellV2: UITableViewCell {
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var descriptionView: UILabel!
    @IBOutlet weak var postView: UIImageView!
    @IBOutlet weak var likeView: UILabel!
    @IBOutlet weak var dateView: UILabel!
    
    
    @IBAction func likeButton(_ sender: UIButton) {
        //when a like button is  pressed it changes to show that its pressesed and vice-versa
        if sender.currentImage == UIImage(named: "like-on"){
            sender.setImage(UIImage(named: "like-off"), for: .normal)
        }
        else{
            sender.setImage(UIImage(named: "like-on"), for: .normal)
        }
        
    }
    
    
    func setView(post:Post) {
        super.layoutSubviews()
        //grabbing images from a given url
        let url = URL(string: post.postURL!)
        let data = try? Data(contentsOf: url!)
        postView.image = UIImage(data: data!)
        
     
                
                
        let url2 = URL(string: (post.user?.avatarURL)!)
        let data2 = try? Data(contentsOf: url2!)
        avatarView.image = UIImage(data: data2!)
        
        let ratio = Float((postView.image?.size.height)!) / Float((postView.image?.size.width)!)
        postView.heightAnchor.constraint(equalTo: postView.widthAnchor, multiplier:CGFloat( ratio) ) .isActive = true
        
    
        
        
        
        
        //making the avatar image round
        avatarView.layer.cornerRadius = avatarView.bounds.width / 2
        avatarView.contentMode = .scaleAspectFill
        avatarView.clipsToBounds = true
        
        
        
        dateView.text = post.createdDate
        userName.text = post.user?.name
        descriptionView.text = post.descripTxt
        descriptionView.numberOfLines = 0
        
        likeView.text = String(post.likeCount!) + " likes"
        
        
    }
    
    
}
