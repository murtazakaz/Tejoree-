//
//  StockRateViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/10/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class StockRateViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("StockCompanyTableViewCell", owner: self, options: nil)?.first as! StockCompanyTableViewCell
       
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 370
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
