//
//  TableViewCell1.swift
//  Tejoree
//
//  Created by Macbook on 11/22/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell {
    
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name3: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var banner: UIImageView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
