//
//  performancereviewviewcontroller.swift
//  Tejoree
//
//  Created by Macbook on 5/7/18.
//  Copyright © 2018 Macbook. All rights reserved.
//
import UIKit

class performancereviewviewcontroller : UIViewController ,UIPickerViewDataSource , UIPickerViewDelegate{
    
    @IBOutlet weak var dropdown: UIPickerView!
    @IBOutlet weak var dropdowntext: UILabel!
    
    var pagelist = ["HCP","Addition Deletion","Performance Review"]

    override func viewDidLoad() {
        super.viewDidLoad()
        dropdown.isHidden = true
        dropdowntext.text = "Performance Review"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            let additionpage = storyboard?.instantiateViewController(withIdentifier: "addition")
            navigationController?.pushViewController( additionpage!, animated: true)
        }
        if(dropdowntext.text == "Performance Review"){
           
        }
        
        
    }
    @IBAction func dropdownbtn(_ sender: Any) {
        dropdown.isHidden = false;
        
    }
}
