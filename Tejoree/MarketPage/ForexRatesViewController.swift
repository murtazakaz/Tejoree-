//
//  ForexRatesViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/8/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit
struct ForexData{
    let cell : Int!
    let text1: String!
    let subtext1: String!
    let text2: String!
    let text3: String!
    let arrowIcon: UIImage!
}
class ForexRatesViewController: UIViewController,UITableViewDelegate , UITableViewDataSource, UIPickerViewDataSource , UIPickerViewDelegate {

    var arrayofdata = [ForexData]()
    @IBOutlet weak var MarketDropDown: UIPickerView!
    var pagelist = ["Market Data Snapshot","Money Market","Forex Rates"]
    @IBOutlet weak var dropdownValuetxt: UILabel!
    @IBOutlet weak var dropdownbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        MarketDropDown.dataSource = self
        MarketDropDown.delegate = self
        MarketDropDown.isHidden = true
        dropdownValuetxt.text = pagelist[2]
        
        arrayofdata = [ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "negative")),ForexData(cell:1, text1:"CAD", subtext1: "CANADIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "negative")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "negative")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),ForexData(cell:1, text1:"AUD", subtext1: "AUSTRALLIAN DOLLAR",text2: "0.1674",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = Bundle.main.loadNibNamed("ForexRatesTableViewCell", owner: self, options: nil)?.first as! ForexRatesTableViewCell
            cell.text1.text = arrayofdata[indexPath.row].text1
            cell.subtext1.text = arrayofdata[indexPath.row].subtext1
            cell.text2.text = arrayofdata[indexPath.row].text2
            cell.text3.text = arrayofdata[indexPath.row].text3
     
            cell.arrowImage.image = arrayofdata[indexPath.row].arrowIcon
        
            return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 45
        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pagelist.count
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pagelist[row]
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dropdownValuetxt.text = pagelist[row]
        MarketDropDown.isHidden = true
        if(dropdownValuetxt.text == "Market Data Snapshot"){
            let MarketDataSnapshots = storyboard?.instantiateViewController(withIdentifier: "MarketDataSnapshots")
            navigationController?.pushViewController( MarketDataSnapshots!, animated: true)
        }
        if(dropdownValuetxt.text == "Money Market"){
            let moneymarketpage = storyboard?.instantiateViewController(withIdentifier: "MoneyMarketPage")
            navigationController?.pushViewController( moneymarketpage!, animated: true)
        }
        if(dropdownValuetxt.text == "Forex Rates"){
            
        }
        
    }
    
    @IBAction func dropdownPressed(_ sender: UIButton) {
        MarketDropDown.isHidden = false
    }

}
