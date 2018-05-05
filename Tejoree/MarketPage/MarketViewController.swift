//
//  MarketViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/3/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit
class Welcome: Codable {
    let data: WelcomeData?
    let isLogin: Bool?
    
    enum CodingKeys: String, CodingKey {
        case data
        case isLogin = "is_login"
    }
    
    init(data: WelcomeData?, isLogin: Bool?) {
        self.data = data
        self.isLogin = isLogin
    }
}

class WelcomeData: Codable {
    let categories: [Category]?
    let commodities: [Commodity]?
    let forexRates: [ForexRate]?
    let moneyMarket: MoneyMarket?
    
    enum CodingKeys: String, CodingKey {
        case categories, commodities
        case forexRates = "forex-rates"
        case moneyMarket = "money-market"
    }
    
    init(categories: [Category]?, commodities: [Commodity]?, forexRates: [ForexRate]?, moneyMarket: MoneyMarket?) {
        self.categories = categories
        self.commodities = commodities
        self.forexRates = forexRates
        self.moneyMarket = moneyMarket
    }
}

class Category: Codable {
    let name, slug: String?
    
    init(name: String?, slug: String?) {
        self.name = name
        self.slug = slug
    }
}

class Commodity: Codable {
    let id, name: String?
    let data: [ForexRate]?
    
    init(id: String?, name: String?, data: [ForexRate]?) {
        self.id = id
        self.name = name
        self.data = data
    }
}

class ForexRate: Codable {
    let name, longName, dataValue, date: String?
    let todaysChange: String?
    let imapact: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case longName = "long_name"
        case dataValue = "data_value"
        case date
        case todaysChange = "todays_change"
        case imapact
    }
    
    init(name: String?, longName: String?, dataValue: String?, date: String?, todaysChange: String?, imapact: String?) {
        self.name = name
        self.longName = longName
        self.dataValue = dataValue
        self.date = date
        self.todaysChange = todaysChange
        self.imapact = imapact
    }
}

enum Imapact: String, Codable {
    case empty = "+"
    case imapact = "-"
}

class MoneyMarket: Codable {
    let categories: [Category]?
    let kibor: Kibor?
    let libor: Libor?
    let pkrv: Pkrv?
    
    init(categories: [Category]?, kibor: Kibor?, libor: Libor?, pkrv: Pkrv?) {
        self.categories = categories
        self.kibor = kibor
        self.libor = libor
        self.pkrv = pkrv
    }
}

class Kibor: Codable {
    let name: String?
    let data: [KiborDatum]?
    
    init(name: String?, data: [KiborDatum]?) {
        self.name = name
        self.data = data
    }
}

class KiborDatum: Codable {
    let tenor, bid, offer: String?
    let frequency: Frequency?
    
    init(tenor: String?, bid: String?, offer: String?, frequency: Frequency?) {
        self.tenor = tenor
        self.bid = bid
        self.offer = offer
        self.frequency = frequency
    }
}

enum Frequency: String, Codable {
    case m = "m"
    case w = "w"
    case y = "y"
}

class Libor: Codable {
    let name: String?
    let data: [LiborDatum]?
    
    init(name: String?, data: [LiborDatum]?) {
        self.name = name
        self.data = data
    }
}

class LiborDatum: Codable {
    let tenor, rate, frequency: String?
    
    init(tenor: String?, rate: String?, frequency: String?) {
        self.tenor = tenor
        self.rate = rate
        self.frequency = frequency
    }
}

class Pkrv: Codable {
    let name: String?
    let data: PkrvData?
    
    init(name: String?, data: PkrvData?) {
        self.name = name
        self.data = data
    }
}

class PkrvData: Codable {
    let dates: [String]?
    let data: [DataDatum]?
    
    init(dates: [String]?, data: [DataDatum]?) {
        self.dates = dates
        self.data = data
    }
}

class DataDatum: Codable {
    let oldDate, newDate, oldMidrate, newMidrate: String?
    let oldChange, newChange, oldTenor, newTenor: String?
    
    enum CodingKeys: String, CodingKey {
        case oldDate = "old_date"
        case newDate = "new_date"
        case oldMidrate = "old_midrate"
        case newMidrate = "new_midrate"
        case oldChange = "old_change"
        case newChange = "new_change"
        case oldTenor = "old_tenor"
        case newTenor = "new_tenor"
    }
    
    init(oldDate: String?, newDate: String?, oldMidrate: String?, newMidrate: String?, oldChange: String?, newChange: String?, oldTenor: String?, newTenor: String?) {
        self.oldDate = oldDate
        self.newDate = newDate
        self.oldMidrate = oldMidrate
        self.newMidrate = newMidrate
        self.oldChange = oldChange
        self.newChange = newChange
        self.oldTenor = oldTenor
        self.newTenor = newTenor
    }
}

// MARK: Convenience initializers

extension Welcome {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Welcome.self, from: data)
        self.init(data: me.data, isLogin: me.isLogin)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension WelcomeData {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(WelcomeData.self, from: data)
        self.init(categories: me.categories, commodities: me.commodities, forexRates: me.forexRates, moneyMarket: me.moneyMarket)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Category {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Category.self, from: data)
        self.init(name: me.name, slug: me.slug)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Commodity {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Commodity.self, from: data)
        self.init(id: me.id, name: me.name, data: me.data)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension ForexRate {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(ForexRate.self, from: data)
        self.init(name: me.name, longName: me.longName, dataValue: me.dataValue, date: me.date, todaysChange: me.todaysChange, imapact: me.imapact)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension MoneyMarket {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(MoneyMarket.self, from: data)
        self.init(categories: me.categories, kibor: me.kibor, libor: me.libor, pkrv: me.pkrv)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Kibor {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Kibor.self, from: data)
        self.init(name: me.name, data: me.data)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension KiborDatum {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(KiborDatum.self, from: data)
        self.init(tenor: me.tenor, bid: me.bid, offer: me.offer, frequency: me.frequency)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Libor {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Libor.self, from: data)
        self.init(name: me.name, data: me.data)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension LiborDatum {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(LiborDatum.self, from: data)
        self.init(tenor: me.tenor, rate: me.rate, frequency: me.frequency)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Pkrv {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Pkrv.self, from: data)
        self.init(name: me.name, data: me.data)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension PkrvData {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(PkrvData.self, from: data)
        self.init(dates: me.dates, data: me.data)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension DataDatum {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(DataDatum.self, from: data)
        self.init(oldDate: me.oldDate, newDate: me.newDate, oldMidrate: me.oldMidrate, newMidrate: me.newMidrate, oldChange: me.oldChange, newChange: me.newChange, oldTenor: me.oldTenor, newTenor: me.newTenor)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

class MarketViewController: UIViewController, UITableViewDelegate , UITableViewDataSource, UIPickerViewDataSource , UIPickerViewDelegate {
   
    var CommoditiesArray_chemical = [ForexRate]()
    var CommoditiesArray_fertilizer = [ForexRate]()
    var CommoditiesArray_steel = [ForexRate]()
    var CommoditiesArray_sugar = [ForexRate]()
    var CommoditiesArray_energy = [ForexRate]()
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
       let sv = UIViewController.displaySpinner(onView: self.view)
        guard let myUrl = URL(string: "http://videostreet.pk/tejori/tjApi/getCategoryData/") else { return }
        var request = URLRequest(url:myUrl)
        request.addValue("876564123", forHTTPHeaderField: "X-TJ-APIKEY")
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "category_id=2&category_type_id=2";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                 UIViewController.removeSpinner(spinner: sv)
                print("something is wrong")
                return
            }
            print("downloaded")
             UIViewController.removeSpinner(spinner: sv)
            
            do
            {
                let decoder = JSONDecoder()
                let MarketData = try decoder.decode(Welcome.self, from: data)
              //  print(MarketData.data?.commodities![0].name)
                self.CommoditiesArray_chemical = (MarketData.data?.commodities![0].data)!
                self.CommoditiesArray_fertilizer = (MarketData.data?.commodities![1].data)!
                self.CommoditiesArray_steel = (MarketData.data?.commodities![2].data)!
                self.CommoditiesArray_sugar = (MarketData.data?.commodities![3].data)!
                self.CommoditiesArray_energy = (MarketData.data?.commodities![4].data)!
             //   self.commoditiesArray = commoditiesres.data
             //   print(self.commoditiesArray[0].name)
                DispatchQueue.main.async {
                    self.marketDataSnapShotsTableView.reloadData()
                }
            } catch {
                 print("something is wrong after downloading")
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
          
            
            if CommoditiesArray_chemical[indexPath.row].imapact == "-" {
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
