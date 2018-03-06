//
//  StockCompanyTableViewCell.swift
//  Tejoree
//
//  Created by Macbook on 12/10/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class StockCompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var targertPrice: UILabel!
    @IBOutlet weak var recommend: UILabel!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var upside: UILabel!
    @IBOutlet weak var yearEnd: UILabel!
    @IBOutlet weak var eps1: UILabel!
    @IBOutlet weak var eps2: UILabel!
    @IBOutlet weak var eps3: UILabel!
    @IBOutlet weak var dps1: UILabel!
    @IBOutlet weak var dps2: UILabel!
    @IBOutlet weak var dps3: UILabel!
    @IBOutlet weak var dvps1: UILabel!
    @IBOutlet weak var dvps2: UILabel!
    @IBOutlet weak var dvps3: UILabel!
    @IBOutlet weak var per1: UILabel!
    @IBOutlet weak var per2: UILabel!
    @IBOutlet weak var per3: UILabel!
    @IBOutlet weak var divYield1: UILabel!
    @IBOutlet weak var divYield2: UILabel!
    @IBOutlet weak var divYield3: UILabel!
    @IBOutlet weak var pbv1: UILabel!
    @IBOutlet weak var pbv2: UILabel!
    @IBOutlet weak var pbv3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
