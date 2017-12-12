//
//  MarketViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/3/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

struct MarketSnapShotData{
    let cell : Int!
    let text1: String!
    let subtext1: String!
    let text2: String!
    let text3: String!
    let arrowIcon: UIImage!
}
class MarketViewController: UIViewController, UITableViewDelegate , UITableViewDataSource, UIPickerViewDataSource , UIPickerViewDelegate {
   
     var arrayofdata = [MarketSnapShotData]()

    @IBOutlet weak var MarketDropDown: UIPickerView!
    var pagelist = ["Market Data Snapshot","Money Market","Forex Rates"]
    @IBOutlet weak var dropdownValuetxt: UILabel!
    @IBOutlet weak var dropdownbtn: UIButton!
    @IBOutlet weak var marketDataSnapShotsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MarketDropDown.dataSource = self
        MarketDropDown.delegate = self
        MarketDropDown.isHidden = true
        dropdownValuetxt.text = "Market Data Snapshot"
        // Do any additional setup after loading the view.
        arrayofdata = [MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),
        MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "negative")),
        MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),
        MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "negative"))
        ,MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive"))
            ,MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "negative")),
             MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),
             MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),
             MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "negative"))
            ,MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive"))
            ,MarketSnapShotData(cell:1, text1:"DOW JONES", subtext1: "United States",text2: "22,775.39",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "negative")),]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return arrayofdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("MarketDataSnapShotsTableViewCell", owner: self, options: nil)?.first as! MarketDataSnapShotsTableViewCell
        cell.Text1.text = arrayofdata[indexPath.row].text1
        cell.SubText1.text = arrayofdata[indexPath.row].subtext1
        cell.Text2.text = arrayofdata[indexPath.row].text2
        cell.Text3.text = arrayofdata[indexPath.row].text3
        cell.ArrowIcon.image = arrayofdata[indexPath.row].arrowIcon
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 60
       
    }
    
    @IBAction func MarketDataSnapshotsSwitch(_ sender: UISegmentedControl) {
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
        if(dropdownValuetxt.text == "Market Data Snapshot"){}
        if(dropdownValuetxt.text == "Money Market"){
            let moneymarketpage = storyboard?.instantiateViewController(withIdentifier: "MoneyMarketPage")
            navigationController?.pushViewController( moneymarketpage!, animated: true)
        }
        if(dropdownValuetxt.text == "Forex Rates"){
            let moneymarketpage = storyboard?.instantiateViewController(withIdentifier: "ForexRatesPage")
            navigationController?.pushViewController( moneymarketpage!, animated: true)
        }
        
        
    }
  
    @IBAction func dropdownPressed(_ sender: UIButton) {
        MarketDropDown.isHidden = false
    }
    
}
