//
//  MoneyMarketViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/8/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

struct MoneyMarketData{
    let cell : Int!
    let text1: String!
    let subtext1: String!
    let text2: String!
    let text3: String!
    let arrowIcon: UIImage!
}

class MoneyMarketViewController: UIViewController,UITableViewDelegate , UITableViewDataSource, UIPickerViewDataSource , UIPickerViewDelegate {
    var selectedtab = 0
    var arrayofdata = [MoneyMarketData]()
    @IBOutlet weak var MarketDropDown: UIPickerView!
    @IBOutlet weak var tableview: UITableView!
    var pagelist = ["Market Data Snapshot","Money Market","Forex Rates"]
    @IBOutlet weak var dropdownValuetxt: UILabel!
    @IBOutlet weak var dropdownbtn: UIButton!
    @IBOutlet weak var tableTitle1: UILabel!
    @IBOutlet weak var tableTitle2: UILabel!
    @IBOutlet weak var tableTitle3: UILabel!
    @IBOutlet weak var tableTitle4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        MarketDropDown.dataSource = self
        MarketDropDown.delegate = self
        MarketDropDown.isHidden = true
        dropdownValuetxt.text = pagelist[1]
        // Do any additional setup after loading the view.
         arrayofdata = [MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "negative")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "negative")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),MoneyMarketData(cell:1, text1:"1 Week", subtext1: "United States",text2: "5.76/5.76",text3:"0.50%", arrowIcon: #imageLiteral(resourceName: "positive")),]
        
        tableTitle1.text = "KIBOR"
        tableTitle2.text = ""
        tableTitle3.text = ""
        tableTitle4.text = "Bid/offer"
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func MoneyMarketTabs(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
         selectedtab = 0
        }
        if sender.selectedSegmentIndex == 1{
            selectedtab = 1    }
        if sender.selectedSegmentIndex == 2{
            selectedtab = 2
                
        }
        self.tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedtab == 0 {
        let cell = Bundle.main.loadNibNamed("KIBORTableViewCell1", owner: self, options: nil)?.first as! KIBORTableViewCell1
            tableTitle1.text = "KIBOR"
            tableTitle2.text = ""
            tableTitle3.text = ""
            tableTitle4.text = "Bid/offer"
        cell.text1.text = arrayofdata[indexPath.row].text1
        cell.text2.text = arrayofdata[indexPath.row].text2
            return cell
        }
        else if selectedtab == 1 {
            let cell = Bundle.main.loadNibNamed("KIBORTableViewCell1", owner: self, options: nil)?.first as! KIBORTableViewCell1
            tableTitle1.text = "LIBOR"
            tableTitle2.text = ""
            tableTitle3.text = ""
            tableTitle4.text = "Bid/offer"
            cell.text1.text = arrayofdata[indexPath.row].text1
            cell.text2.text = arrayofdata[indexPath.row].text2
            return cell
        }
        else {
            let cell = Bundle.main.loadNibNamed("PKRVTableViewCell", owner: self, options: nil)?.first as! PKRVTableViewCell
            tableTitle1.text = "PKRV"
            tableTitle2.text = "29 SEP"
            tableTitle3.text = "28 SEP"
            tableTitle4.text = "Chg(bps)"
            cell.text1.text = arrayofdata[indexPath.row].text1
            cell.text2.text = arrayofdata[indexPath.row].text2
            cell.arrowImage.image = arrayofdata[indexPath.row].arrowIcon
            return cell
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 30
        
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
           
        }
        if(dropdownValuetxt.text == "Forex Rates"){
            let ForexRatesPage = storyboard?.instantiateViewController(withIdentifier: "ForexRatesPage")
            navigationController?.pushViewController( ForexRatesPage!, animated: true)
        }
        
    }
    
    @IBAction func dropdownPressed(_ sender: UIButton) {
        MarketDropDown.isHidden = false
    }
}
