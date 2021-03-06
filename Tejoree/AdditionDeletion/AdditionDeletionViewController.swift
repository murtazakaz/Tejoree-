//
//  AdditionDeletionViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/10/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class AdditionDeletionViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource,UIPickerViewDataSource , UIPickerViewDelegate{
 
    @IBOutlet weak var dropdown: UIPickerView!
    @IBOutlet weak var dropdowntext: UILabel!
    
    var pagelist = ["HCP","Addition Deletion","Performance Review"]
    override func viewDidLoad() {
        super.viewDidLoad()
        dropdown.isHidden = true
        dropdowntext.text = "Addition Deletion"
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
       // let detailnews = storyboard?.instantiateViewController(withIdentifier: "PerformanceReviewPage")
        //navigationController?.pushViewController( detailnews!, animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pagelist.count
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pagelist[row]
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dropdowntext.text = pagelist[row]
        dropdown.isHidden = true
        if(dropdowntext.text == "HCP"){
            let highconvictionpage = storyboard?.instantiateViewController(withIdentifier: "highconviction")
            navigationController?.pushViewController( highconvictionpage!, animated: true)
        }
        if(dropdowntext.text == "Addition Deletion"){
          
        }
        if(dropdowntext.text == "Performance Review"){
            let PerformanceReviewPage = storyboard?.instantiateViewController(withIdentifier: "PerformanceReviewPage")
            navigationController?.pushViewController( PerformanceReviewPage!, animated: true)
        }
        
        
    }
    @IBAction func dropdownbtn(_ sender: Any) {
          dropdown.isHidden = false;
        
    }
    
}
