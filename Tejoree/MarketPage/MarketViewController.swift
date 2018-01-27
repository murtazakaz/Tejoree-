//
//  MarketViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/3/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit
/*class CommoditiesData : Codable {
    let data: [Commodities]
    
    init(data: [Commodities]) {
        self.data = data
    }
}
class Commodities: Codable {
    
    let id: String
    let name: String
    let data: [Chemical]
    
    
    init( id: String, title: String, data: [Chemical]) {
        self.id = id
        self.name = title
        self.data = data
    
    }
}
class Chemical: Codable {
    
    let name: String
    let long_name: String
    let data_value: String
    let date : String
    let todays_change: String
    let impact: String
    
    
    init( name: String, long_name: String, data_value: String, date: String , todays_change: String, impact: String) {
        self.name = name
        self.long_name = long_name
        self.data_value = data_value
        self.date = date
        self.todays_change =  todays_change
        self.impact = impact
        
    }
} */
class Welcome: Codable {
    let data: PurpleData
    let isLogin: Bool
    
    enum CodingKeys: String, CodingKey {
        case data
        case isLogin = "is_login"
    }
    
    init(data: PurpleData, isLogin: Bool) {
        self.data = data
        self.isLogin = isLogin
    }
}

class PurpleData: Codable {
    let categories: [Category]
    let commodities: [Commodity]
    let forexRates: [CommodityDatum]
    let moneyMarket: MoneyMarket
    
    enum CodingKeys: String, CodingKey {
        case categories, commodities
        case forexRates = "forex-rates"
        case moneyMarket = "money-market"
    }
    
    init(categories: [Category], commodities: [Commodity], forexRates: [CommodityDatum], moneyMarket: MoneyMarket) {
        self.categories = categories
        self.commodities = commodities
        self.forexRates = forexRates
        self.moneyMarket = moneyMarket
    }
}

class Category: Codable {
    let name, slug: String
    
    init(name: String, slug: String) {
        self.name = name
        self.slug = slug
    }
}

class Commodity: Codable {
    let id, name: String
    let data: [CommodityDatum]
    
    init(id: String, name: String, data: [CommodityDatum]) {
        self.id = id
        self.name = name
        self.data = data
    }
}

class CommodityDatum: Codable {
    let name, longName, dataValue, date: String
    let todaysChange, imapact: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case longName = "long_name"
        case dataValue = "data_value"
        case date
        case todaysChange = "todays_change"
        case imapact
    }
    
    init(name: String, longName: String, dataValue: String, date: String, todaysChange: String, imapact: String) {
        self.name = name
        self.longName = longName
        self.dataValue = dataValue
        self.date = date
        self.todaysChange = todaysChange
        self.imapact = imapact
    }
}

class MoneyMarket: Codable {
    let categories: [Category]
    let kibor: Kibor
    let libor: Libor
    let pkrv: Pkrv
    
    init(categories: [Category], kibor: Kibor, libor: Libor, pkrv: Pkrv) {
        self.categories = categories
        self.kibor = kibor
        self.libor = libor
        self.pkrv = pkrv
    }
}

class Kibor: Codable {
    let name: String
    let data: [KiborDatum]
    
    init(name: String, data: [KiborDatum]) {
        self.name = name
        self.data = data
    }
}

class KiborDatum: Codable {
    let tenor, bid, offer, frequency: String
    
    init(tenor: String, bid: String, offer: String, frequency: String) {
        self.tenor = tenor
        self.bid = bid
        self.offer = offer
        self.frequency = frequency
    }
}

class Libor: Codable {
    let name: String
    let data: [LiborDatum]
    
    init(name: String, data: [LiborDatum]) {
        self.name = name
        self.data = data
    }
}

class LiborDatum: Codable {
    let tenor, rate, frequency: String
    
    init(tenor: String, rate: String, frequency: String) {
        self.tenor = tenor
        self.rate = rate
        self.frequency = frequency
    }
}

class Pkrv: Codable {
    let name: String
    let data: [PkrvDatum]
    
    init(name: String, data: [PkrvDatum]) {
        self.name = name
        self.data = data
    }
}

class PkrvDatum: Codable {
    let tenor, midRate, change, frequency: String
    
    enum CodingKeys: String, CodingKey {
        case tenor
        case midRate = "mid_rate"
        case change, frequency
    }
    
    init(tenor: String, midRate: String, change: String, frequency: String) {
        self.tenor = tenor
        self.midRate = midRate
        self.change = change
        self.frequency = frequency
    }
}

// MARK: Convenience initializers

extension Welcome {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Welcome.self, from: data) else { return nil }
        self.init(data: me.data, isLogin: me.isLogin)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension PurpleData {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(PurpleData.self, from: data) else { return nil }
        self.init(categories: me.categories, commodities: me.commodities, forexRates: me.forexRates, moneyMarket: me.moneyMarket)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Category {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Category.self, from: data) else { return nil }
        self.init(name: me.name, slug: me.slug)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Commodity {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Commodity.self, from: data) else { return nil }
        self.init(id: me.id, name: me.name, data: me.data)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension CommodityDatum {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(CommodityDatum.self, from: data) else { return nil }
        self.init(name: me.name, longName: me.longName, dataValue: me.dataValue, date: me.date, todaysChange: me.todaysChange, imapact: me.imapact)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension MoneyMarket {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(MoneyMarket.self, from: data) else { return nil }
        self.init(categories: me.categories, kibor: me.kibor, libor: me.libor, pkrv: me.pkrv)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Kibor {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Kibor.self, from: data) else { return nil }
        self.init(name: me.name, data: me.data)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension KiborDatum {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(KiborDatum.self, from: data) else { return nil }
        self.init(tenor: me.tenor, bid: me.bid, offer: me.offer, frequency: me.frequency)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Libor {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Libor.self, from: data) else { return nil }
        self.init(name: me.name, data: me.data)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension LiborDatum {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(LiborDatum.self, from: data) else { return nil }
        self.init(tenor: me.tenor, rate: me.rate, frequency: me.frequency)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Pkrv {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Pkrv.self, from: data) else { return nil }
        self.init(name: me.name, data: me.data)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension PkrvDatum {
    convenience init?(data: Data) {
        guard let me = try? JSONDecoder().decode(PkrvDatum.self, from: data) else { return nil }
        self.init(tenor: me.tenor, midRate: me.midRate, change: me.change, frequency: me.frequency)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    convenience init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
struct MarketSnapShotData{
    let cell : Int!
    let text1: String!
    let subtext1: String!
    let text2: String!
    let text3: String!
    let arrowIcon: UIImage!
}
class MarketViewController: UIViewController, UITableViewDelegate , UITableViewDataSource, UIPickerViewDataSource , UIPickerViewDelegate {
   
    var CommoditiesArray_chemical = [CommodityDatum]()
    var CommoditiesArray_fertilizer = [CommodityDatum]()
    var CommoditiesArray_steel = [CommodityDatum]()
    var CommoditiesArray_sugar = [CommodityDatum]()
    var CommoditiesArray_energy = [CommodityDatum]()
    var selectedtab_comm = 0
    var rowscount = 0
    @IBOutlet weak var CommoditiesTabs: UISegmentedControl!
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
        fetchCommodities()
        // Do any additional setup after loading the view.
      
    }
    
    //fetching data
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
                  self.CommoditiesArray_chemical = MarketData.data.commodities[0].data
                  self.CommoditiesArray_fertilizer = MarketData.data.commodities[1].data
                  self.CommoditiesArray_steel = MarketData.data.commodities[2].data
                  self.CommoditiesArray_sugar = MarketData.data.commodities[3].data
                  self.CommoditiesArray_energy = MarketData.data.commodities[4].data
             //   self.commoditiesArray = commoditiesres.data
             //   print(self.commoditiesArray[0].name)
                DispatchQueue.main.async {
                    self.marketDataSnapShotsTableView.reloadData()
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
        
        if self.selectedtab_comm == 0{
            
            self.rowscount = self.CommoditiesArray_chemical.count
        }
        if self.selectedtab_comm == 1{
            
            self.rowscount = self.CommoditiesArray_fertilizer.count
        }
        if self.selectedtab_comm == 2{
            
            self.rowscount = self.CommoditiesArray_steel.count
        }
        if self.selectedtab_comm == 3{
            
            self.rowscount = self.CommoditiesArray_sugar.count
        }
        if self.selectedtab_comm == 4{
            
            self.rowscount = self.CommoditiesArray_energy.count
        }
        return self.rowscount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if self.selectedtab_comm == 0{
              let cell = Bundle.main.loadNibNamed("MarketDataSnapShotsTableViewCell", owner: self, options: nil)?.first as! MarketDataSnapShotsTableViewCell
            cell.Text1.text = CommoditiesArray_chemical[indexPath.row].name
            cell.SubText1.text = CommoditiesArray_chemical[indexPath.row].longName
            cell.Text2.text = CommoditiesArray_chemical[indexPath.row].dataValue
            cell.Text3.text = CommoditiesArray_chemical[indexPath.row].todaysChange
          
            
            if CommoditiesArray_chemical[indexPath.row].imapact == "-"{
                cell.Text3.textColor = UIColor.red
                cell.ArrowIcon.image = UIImage(named: "negative")
            }
            else{
                
                cell.ArrowIcon.image = UIImage(named: "positive")
            }
             return cell
        }
        else if self.selectedtab_comm == 1{
              let cell2 = Bundle.main.loadNibNamed("MarketDataSnapShotsTableViewCell", owner: self, options: nil)?.first as! MarketDataSnapShotsTableViewCell
            cell2.Text1.text = CommoditiesArray_fertilizer[indexPath.row].name
            cell2.SubText1.text = CommoditiesArray_fertilizer[indexPath.row].longName
            cell2.Text2.text = CommoditiesArray_fertilizer[indexPath.row].dataValue
            cell2.Text3.text = CommoditiesArray_fertilizer[indexPath.row].todaysChange
            
            if CommoditiesArray_fertilizer[indexPath.row].imapact == "-"{
                cell2.Text3.textColor = UIColor.red
                cell2.ArrowIcon.image = UIImage(named: "negative")
            }
            else{
                
                cell2.ArrowIcon.image = UIImage(named: "positive")
            }
             return cell2
        }
        else if self.selectedtab_comm == 2{
              let cell3 = Bundle.main.loadNibNamed("MarketDataSnapShotsTableViewCell", owner: self, options: nil)?.first as! MarketDataSnapShotsTableViewCell
            cell3.Text1.text = CommoditiesArray_steel[indexPath.row].name
            cell3.SubText1.text = CommoditiesArray_steel[indexPath.row].longName
            cell3.Text2.text = CommoditiesArray_steel[indexPath.row].dataValue
            cell3.Text3.text = CommoditiesArray_steel[indexPath.row].todaysChange
            
            if CommoditiesArray_steel[indexPath.row].imapact == "-"{
                cell3.Text3.textColor = UIColor.red
                cell3.ArrowIcon.image = UIImage(named: "negative")
            }
            else{
                
                cell3.ArrowIcon.image = UIImage(named: "positive")
            }
             return cell3
        }
      else if self.selectedtab_comm == 3{
              let cell4 = Bundle.main.loadNibNamed("MarketDataSnapShotsTableViewCell", owner: self, options: nil)?.first as! MarketDataSnapShotsTableViewCell
            cell4.Text1.text = CommoditiesArray_sugar[indexPath.row].name
            cell4.SubText1.text = CommoditiesArray_sugar[indexPath.row].longName
            cell4.Text2.text = CommoditiesArray_sugar[indexPath.row].dataValue
            cell4.Text3.text = CommoditiesArray_sugar[indexPath.row].todaysChange
            
            if CommoditiesArray_sugar[indexPath.row].imapact == "-"{
                cell4.Text3.textColor = UIColor.red
                cell4.ArrowIcon.image = UIImage(named: "negative")
            }
            else{
                
                cell4.ArrowIcon.image = UIImage(named: "positive")
            }
             return cell4
        }
        else {
              let cell5 = Bundle.main.loadNibNamed("MarketDataSnapShotsTableViewCell", owner: self, options: nil)?.first as! MarketDataSnapShotsTableViewCell
            cell5.Text1.text = CommoditiesArray_energy[indexPath.row].name
            cell5.SubText1.text = CommoditiesArray_energy[indexPath.row].longName
            cell5.Text2.text = CommoditiesArray_energy[indexPath.row].dataValue
            cell5.Text3.text = CommoditiesArray_energy[indexPath.row].todaysChange
            
            if CommoditiesArray_energy[indexPath.row].imapact == "-"{
                cell5.Text3.textColor = UIColor.red
                cell5.ArrowIcon.image = UIImage(named: "negative")
            }
            else{
                
                cell5.ArrowIcon.image = UIImage(named: "positive")
            }
             return cell5
        }
      
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
    @IBAction func commoditiesTabs(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            selectedtab_comm = 0
        }
        if sender.selectedSegmentIndex == 1{
            selectedtab_comm = 1    }
        if sender.selectedSegmentIndex == 2{
           selectedtab_comm = 2
            
        }
        if sender.selectedSegmentIndex == 3{
            selectedtab_comm = 3
            
        }
        if sender.selectedSegmentIndex == 4{
            selectedtab_comm = 4
            
        }
        self.marketDataSnapShotsTableView.reloadData()
    }
    
    @IBAction func dropdownPressed(_ sender: UIButton) {
        MarketDropDown.isHidden = false
    }
    
}
