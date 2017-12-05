//
//  MarketDataSnapShotsTableViewCell.swift
//  Tejoree
//
//  Created by Macbook on 12/3/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class MarketDataSnapShotsTableViewCell: UITableViewCell {

    @IBOutlet weak var Text1: UILabel!
    @IBOutlet weak var SubText1: UILabel!
    @IBOutlet weak var Text2: UILabel!
    @IBOutlet weak var Text3: UILabel!
    @IBOutlet weak var ArrowIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
