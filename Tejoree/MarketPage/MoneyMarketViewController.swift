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
    var KiborArray = [KiborDatum]()
    var LiborArray = [LiborDatum]()
     var PKRVArray = [PkrvDatum]()
    
    @IBOutlet weak var MarketDropDown: UIPickerView!
    @IBOutlet weak var tableview: UITableView!
    var pagelist = ["Market Data Snapshot","Money Market","Forex Rates"]
    @IBOutlet weak var dropdownValuetxt: UILabel!
    @IBOutlet weak var dropdownbtn: UIButton!
    @IBOutlet weak var tableTitle1: UILabel!
    @IBOutlet weak var tableTitle2: UILabel!
    @IBOutlet weak var tableTitle3: UILabel!
    @IBOutlet weak var tableTitle4: UILabel!
    var rows = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCommodities()
      
        MarketDropDown.dataSource = self
        MarketDropDown.delegate = self
        MarketDropDown.isHidden = true
        dropdownValuetxt.text = pagelist[1]

        tableTitle1.text = "KIBOR"
        tableTitle2.text = ""
        tableTitle3.text = ""
        tableTitle4.text = "Bid/offer"
        
    }
    func fetchCommodities(){
        
        guard let myUrl = URL(string: "http://videostreet.pk/tejori/tjApi/getCategoryData/") else { return }
        var request = URLRequest(url:myUrl)
        request.addValue("876564123", forHTTPHeaderField: "X-TJ-APIKEY")
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "category_id=2&category_type_id=2";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            print("downloaded")
            
            
            do
            {
                let decoder = JSONDecoder()
                let MarketData = try decoder.decode(Welcome.self, from: data)
                print(MarketData.data.commodities[0].name)
                self.KiborArray = MarketData.data.moneyMarket.kibor.data
               self.LiborArray = MarketData.data.moneyMarket.libor.data
                self.PKRVArray = MarketData.data.moneyMarket.pkrv.data
              
                DispatchQueue.main.async {
                      self.tableview.reloadData()
                }
            } catch {
                print(error)
            }
            }.resume()
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
        
        if self.selectedtab == 0{
            
             self.rows = KiborArray.count
        }
        if self.selectedtab == 1{
           
             self.rows = LiborArray.count
        }
        if self.selectedtab == 2{
           
            self.rows = PKRVArray.count
        }
        return self.rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedtab == 0 {
        let cell = Bundle.main.loadNibNamed("KIBORTableViewCell1", owner: self, options: nil)?.first as! KIBORTableViewCell1
            tableTitle1.text = "KIBOR"
            tableTitle2.text = ""
            tableTitle3.text = ""
            tableTitle4.text = "Bid/offer"
            
            if KiborArray[indexPath.row].frequency == "w"{
                cell.text1.text = KiborArray[indexPath.row].tenor + " Week"
                
            }else if KiborArray[indexPath.row].frequency == "m"{
                cell.text1.text = KiborArray[indexPath.row].tenor + " Month"
            }else{
                cell.text1.text = KiborArray[indexPath.row].tenor + " Year"
            }
            
       
        cell.text2.text = KiborArray[indexPath.row].bid + "/" + KiborArray[indexPath.row].offer
            return cell
        }
        else if selectedtab == 1 {
            let cell2 = Bundle.main.loadNibNamed("KIBORTableViewCell1", owner: self, options: nil)?.first as! KIBORTableViewCell1
            tableTitle1.text = "LIBOR"
            tableTitle2.text = ""
            tableTitle3.text = ""
            tableTitle4.text = "Bid/offer"
          //  cell.text1.text = LiborArray[indexPath.row].text1
            if LiborArray[indexPath.row].frequency == "w"{
                cell2.text1.text = LiborArray[indexPath.row].tenor + " Week"
                
            }else if LiborArray[indexPath.row].frequency == "m"{
                cell2.text1.text = LiborArray[indexPath.row].tenor + " Month"
            }else if LiborArray[indexPath.row].frequency == "y"{
                cell2.text1.text = LiborArray[indexPath.row].tenor + " Year"
            }else{
                cell2.text1.text = LiborArray[indexPath.row].tenor + " on"
            }
            cell2.text2.text = LiborArray[indexPath.row].rate
            return cell2
        }
        else {
            let cell3 = Bundle.main.loadNibNamed("PKRVTableViewCell", owner: self, options: nil)?.first as! PKRVTableViewCell
            tableTitle1.text = "PKRV"
            tableTitle2.text = ""//"29 SEP"
            tableTitle3.text = ""//"28 SEP"
            tableTitle4.text = "Chg(bps)"
           //converting duration to long
            if PKRVArray[indexPath.row].frequency == "w"{
                 cell3.text1.text = PKRVArray[indexPath.row].tenor + " Week"
                
            }else if PKRVArray[indexPath.row].frequency == "m"{
                cell3.text1.text = PKRVArray[indexPath.row].tenor + " Month"
            }else if PKRVArray[indexPath.row].frequency == "y"{
                cell3.text1.text = PKRVArray[indexPath.row].tenor + " Year"
            }else{
                 cell3.text1.text = PKRVArray[indexPath.row].tenor + " On"
            }
           // cell3.text1.text = PKRVArray[indexPath.row].tenor
            cell3.text2.text = PKRVArray[indexPath.row].midRate
           //if change < 0 display negative
            if PKRVArray[indexPath.row].change < "0"{
                cell3.arrowImage.image = UIImage(named: "negative")
                
            }else{
                cell3.arrowImage.image = UIImage(named: "positive")
            }
        //    cell3.arrowImage.image = PKRVArray[indexPath.row].arrowIcon
            return cell3
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
