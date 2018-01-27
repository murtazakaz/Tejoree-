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

    var ForexArray = [CommodityDatum]()
    @IBOutlet weak var MarketDropDown: UIPickerView!
    var pagelist = ["Market Data Snapshot","Money Market","Forex Rates"]
    @IBOutlet weak var dropdownValuetxt: UILabel!
    @IBOutlet weak var dropdownbtn: UIButton!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCommodities()
        MarketDropDown.dataSource = self
        MarketDropDown.delegate = self
        MarketDropDown.isHidden = true
        dropdownValuetxt.text = pagelist[2]
        
      
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
                self.ForexArray = MarketData.data.forexRates
             
                
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ForexArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = Bundle.main.loadNibNamed("ForexRatesTableViewCell", owner: self, options: nil)?.first as! ForexRatesTableViewCell
            cell.text1.text = ForexArray[indexPath.row].longName
            cell.subtext1.text = ForexArray[indexPath.row].name
            cell.text2.text = ForexArray[indexPath.row].dataValue
            cell.text3.text = ForexArray[indexPath.row].todaysChange
        if ForexArray[indexPath.row].todaysChange < "0"{
            cell.arrowImage.image  = UIImage(named: "negative")
             cell.text3.textColor = UIColor.red
        }else{
            cell.arrowImage.image  = UIImage(named: "positive")
        }
           // cell.arrowImage.image = ForexArray[indexPath.row].arrowIcon
        
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
