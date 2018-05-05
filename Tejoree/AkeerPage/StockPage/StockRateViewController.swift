//
//  StockRateViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/10/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit
class StockArrayData: Codable {
    let data: DataArrayClass?
    let isLogin: Bool?
    
    enum CodingKeys: String, CodingKey {
        case data
        case isLogin = "is_login"
    }
    
    init(data: DataArrayClass?, isLogin: Bool?) {
        self.data = data
        self.isLogin = isLogin
    }
}

class DataArrayClass: Codable {
    let StockArrayRating: StockArrayRating?
    
    enum CodingKeys: String, CodingKey {
        case StockArrayRating = "stock-rating"
    }
    
    init(StockArrayRating: StockArrayRating?) {
        self.StockArrayRating = StockArrayRating
    }
}

class StockArrayRating: Codable {
    let symbol, yearEnd, price, target: String?
    let upside: String?
    let catData: catData?
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case yearEnd = "year_end"
        case price, target, upside
        case catData = "category_data"
    }
    
    init(symbol: String?, yearEnd: String?, price: String?, target: String?, upside: String?, catData: catData?) {
        self.symbol = symbol
        self.yearEnd = yearEnd
        self.price = price
        self.target = target
        self.upside = upside
        self.catData = catData
    }
}

class catData: Codable {
    let eps, dps, per, divYield: [stockcatarray]?
    let bvps: [[String: String?]]?
    
    enum CodingKeys: String, CodingKey {
        case eps, dps, per
        case divYield = "div yield"
        case bvps
    }
    
    init(eps: [stockcatarray]?, dps: [stockcatarray]?, per: [stockcatarray]?, divYield: [stockcatarray]?, bvps: [[String: String?]]?) {
        self.eps = eps
        self.dps = dps
        self.per = per
        self.divYield = divYield
        self.bvps = bvps
    }
}
class stockcatarray: Codable {
    
    let a : String?
    let b : String?
    let c : String?
    
    
    enum CodingKeys: String, CodingKey {
        
        case a
        case b
        case c
        
        
    }
    init(a : String?, b : String?, c : String?){
        self.a = a
        self.b = b
        self.c  = c
        
    }
}
extension stockcatarray {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(stockcatarray.self, from: data)
        self.init(a: me.a, b: me.b,c : me.c)
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
// MARK: Convenience initializers

extension StockArrayData {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(StockArrayData.self, from: data)
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

extension DataArrayClass {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(DataArrayClass.self, from: data)
        self.init(StockArrayRating: me.StockArrayRating)
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

extension StockArrayRating {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(StockArrayRating.self, from: data)
        self.init(symbol: me.symbol, yearEnd: me.yearEnd, price: me.price, target: me.target, upside: me.upside, catData: me.catData)
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

extension catData {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(catData.self, from: data)
        self.init(eps: me.eps, dps: me.dps, per: me.per, divYield: me.divYield, bvps: me.bvps)
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

class StockRateViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    @IBOutlet weak var stockTable: UITableView!
    var sym : String = ""
    var target : String = ""
     var rec : String = ""
    var curPrice : String = ""
    var upside : String = ""
    var yearEnd : String = ""
    var epsArray = [stockcatarray]()
      var dpsArray = [stockcatarray]()
      var bvpsArray = [[String: String?]]()
      var perArray = [stockcatarray]()
      var divArray = [stockcatarray]()
    var bvps = [String?]()
    override func viewDidLoad() {
        super.viewDidLoad()
fetchStock()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchStock(){
        
        guard let myUrl = URL(string: "http://videostreet.pk/tejori/tjApi/getCategoryData/") else { return }
        var request = URLRequest(url:myUrl)
        request.addValue("876564123", forHTTPHeaderField: "X-TJ-APIKEY")
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "category_id=3&category_type_id=3";
        
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
                let stockData = try decoder.decode(StockArrayData.self, from: data)
                 print(stockData.data?.StockArrayRating?.symbol)
                self.sym = (stockData.data?.StockArrayRating?.symbol)!
                self.target = (stockData.data?.StockArrayRating?.target)!
                self.curPrice = (stockData.data?.StockArrayRating?.price)!
                self.upside = (stockData.data?.StockArrayRating?.upside)!
                self.yearEnd = (stockData.data?.StockArrayRating?.yearEnd)!
                self.epsArray = stockData.data!.StockArrayRating!.catData!.eps!
                print(stockData.data!.StockArrayRating!.catData!.eps![1].a)
                self.dpsArray = stockData.data!.StockArrayRating!.catData!.dps!
                self.bvpsArray = (stockData.data!.StockArrayRating?.catData?.bvps)!
                self.perArray = stockData.data!.StockArrayRating!.catData!.per!
                self.divArray = stockData.data!.StockArrayRating!.catData!.divYield!
                //   self.commoditiesArray = commoditiesres.data
                //   print(self.commoditiesArray[0].name)
                DispatchQueue.main.async {
                  self.stockTable.reloadData()
                    
                }
            } catch {
                print(error)
            }
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = Bundle.main.loadNibNamed("StockCompanyTableViewCell", owner: self, options: nil)?.first as! StockCompanyTableViewCell
        cell.companyName.text = "Pakistan State Oil"
        cell.symbol.text = self.sym
        cell.recommend.text = "Buy"
        cell.targertPrice.text = self.target
        cell.currentPrice.text = self.curPrice
        cell.upside.text = self.upside
        cell.yearEnd.text = self.yearEnd
        if self.epsArray.count > 0 {
            
        cell.eps1.text = self.epsArray[0].a
        cell.eps2.text = self.epsArray[1].b
        cell.eps3.text = self.epsArray[2].c
        
        cell.dps1.text = self.dpsArray[0].a
        cell.dps2.text = self.dpsArray[1].b
        cell.dps3.text = self.dpsArray[2].c
         
            for airportCode in bvpsArray{
                let y = airportCode.values
                print(y)
            }
           // cell.dvps1.text = self.bvpsArray["2018"]
       // cell.dvps2.text = self.bvpsArray[1]
       // cell.dvps3.text = self.bvpsArray[2]
        
        cell.per1.text = self.perArray[0].a
        cell.per2.text = self.perArray[1].b
        cell.per3.text = self.perArray[2].c
            
        
        cell.divYield1.text = self.divArray[0].a
        cell.divYield2.text = self.divArray[1].b
        cell.divYield3.text = self.divArray[2].c
 
        }
        
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 370
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
