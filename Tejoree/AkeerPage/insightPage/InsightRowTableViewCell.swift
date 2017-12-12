//
//  InsightRowTableViewCell.swift
//  Tejoree
//
//  Created by Macbook on 12/6/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class InsightRowTableViewCell: UITableViewCell {

    @IBOutlet weak var publishDate: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var publishbyName: UILabel!
    @IBOutlet weak var analystName: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
