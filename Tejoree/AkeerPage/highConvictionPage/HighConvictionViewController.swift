//
//  HighConvictionViewController.swift
//  Tejoree
//
//  Created by Macbook on 3/6/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class HighConvictionViewController: UIViewController, UITableViewDelegate , UITableViewDataSource,UIPickerViewDataSource , UIPickerViewDelegate{
   
    
    
    var pagelist = ["HCP","Addition Deletion","Performance Review"]
    @IBOutlet weak var dropdowntext: UILabel!
    @IBOutlet weak var dropdown: UIPickerView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropdown.isHidden = true
        dropdowntext.text = "HCP"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("HighConvictionTableViewCell", owner: self, options: nil)?.first as! HighConvictionTableViewCell
        
        // Configure the cell...
        
        return cell
    }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 96
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
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
        if(dropdowntext.text == "HCP"){}
        if(dropdowntext.text == "Addition Deletion"){
            let additionpage = storyboard?.instantiateViewController(withIdentifier: "addition")
            navigationController?.pushViewController( additionpage!, animated: true)
        }
        if(dropdowntext.text == "Performance Review"){
            let PerformanceReviewPage = storyboard?.instantiateViewController(withIdentifier: "PerformanceReviewPage")
            navigationController?.pushViewController( PerformanceReviewPage!, animated: true)
        }
        
        
    }
    
    @IBAction func opendropdown(_ sender: Any) {
        dropdown.isHidden = false;
    }
}
