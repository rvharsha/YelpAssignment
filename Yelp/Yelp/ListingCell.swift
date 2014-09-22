//
//  ListingCell.swift
//  Yelp
//
//  Created by Harsha Vashisht on 9/21/14.
//  Copyright (c) 2014 Harsha Vashisht. All rights reserved.
//

import UIKit

class ListingCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var ratingsPosterView: UIImageView!
    
    
    var listing:NSDictionary = NSDictionary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        self.nameLabel.text = listing["name"] as String?
        self.addressLabel.text = listing["display_address"] as String?
        
        var imageUrl = listing["image_url"] as? String
        posterView.layer.cornerRadius = 5;
        posterView.clipsToBounds = true;
        if let listingImageUrl = imageUrl {
            self.posterView.setImageWithURL(NSURL(string: listingImageUrl))
        }
        
        var ratingsImageUrl = listing["rating_img_url"] as? String
        if let ratingsImgUrl = ratingsImageUrl {
            self.ratingsPosterView.setImageWithURL(NSURL(string: ratingsImgUrl))
        }
        
        var ratingsCount = listing["review_count"] as? Int
        self.reviewsLabel.text = "\(ratingsCount!) Reviews"
        
        //Construct the address
        var location = listing["location"] as NSDictionary
        var address = location["display_address"] as [String]
        var labelAddress = ""
        if (address.count >= 1) {
            labelAddress = "\(address[0]), \(address[1])"
        }
        self.addressLabel.text = labelAddress
        
        var cuisine = listing["categories"] as [[String]]
        var cuisineLabelString = ""
        var first = true
        for item in cuisine {
            if first == true {
                cuisineLabelString += "\(item[0])"
                first = false
            } else {
                cuisineLabelString += ", \(item[0])"
            }
        }
        self.cuisineLabel.text = cuisineLabelString
        
    }

}
