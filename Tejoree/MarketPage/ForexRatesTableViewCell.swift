//
//  ForexRatesTableViewCell.swift
//  Tejoree
//
//  Created by Macbook on 12/10/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class ForexRatesTableViewCell: UITableViewCell {

    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var subtext1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
