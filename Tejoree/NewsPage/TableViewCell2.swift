//
//  TableViewCell2.swift
//  Tejoree
//
//  Created by Macbook on 12/1/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {
    @IBOutlet weak var thumbnail : UIImageView!
@IBOutlet weak var Title : UILabel!
    @IBOutlet weak var type1 : UILabel!
     @IBOutlet weak var type2 : UILabel!
     @IBOutlet weak var datetext : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
