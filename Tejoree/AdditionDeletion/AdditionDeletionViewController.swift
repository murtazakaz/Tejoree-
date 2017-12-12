//
//  AdditionDeletionViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/10/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class AdditionDeletionViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("AdditionDeletionTableViewCell", owner: self, options: nil)?.first as! AdditionDeletionTableViewCell
       
        
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 40
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailnews = storyboard?.instantiateViewController(withIdentifier: "PerformanceReviewPage")
        navigationController?.pushViewController( detailnews!, animated: true)
    }

}
