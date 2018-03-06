//
//  StockRateViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/10/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class StockRateViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    @IBOutlet weak var stockTable: UITableView!
    var sym : String = ""
    var target : String = ""
     var rec : String = ""
    var curPrice : String = ""
    var upside : String = ""
    var yearEnd : String = ""
    var epsArray = [Bvp]()
      var dpsArray = [Bvp]()
      var bvpsArray = [Bvp]()
      var perArray = [Bvp]()
      var divArray = [Bvp]()
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
                let stockData = try decoder.decode(Akseer.self, from: data)
                 print(stockData.data.stockRating)
               self.sym = stockData.data.stockRating.symbol
                 self.target = stockData.data.stockRating.target
                 self.curPrice = stockData.data.stockRating.price
                 self.upside = stockData.data.stockRating.upside
                 self.yearEnd = stockData.data.stockRating.yearEnd
                 self.epsArray = stockData.data.stockRating.categoryData.eps
               // print(self.epsArray[0].the2016, self.epsArray[1].the2017)
                 self.dpsArray = stockData.data.stockRating.categoryData.dps
                 self.bvpsArray = stockData.data.stockRating.categoryData.bvps
                 self.perArray = stockData.data.stockRating.categoryData.per
                 self.divArray = stockData.data.stockRating.categoryData.divYield
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
            
        cell.eps1.text = self.epsArray[0].the2016
        cell.eps2.text = self.epsArray[1].the2017
        cell.eps3.text = self.epsArray[2].the2018
        
        cell.dps1.text = self.dpsArray[0].the2016
        cell.dps2.text = self.dpsArray[1].the2017
        cell.dps3.text = self.dpsArray[2].the2018
            
        cell.dvps1.text = self.bvpsArray[0].the2016
        cell.dvps2.text = self.bvpsArray[1].the2017
        cell.dvps3.text = self.bvpsArray[2].the2018
        
        cell.per1.text = self.perArray[0].the2016
        cell.per2.text = self.perArray[1].the2017
        cell.per3.text = self.perArray[2].the2018
            
        
        cell.divYield1.text = self.divArray[0].the2016
        cell.divYield2.text = self.divArray[1].the2017
        cell.divYield3.text = self.divArray[2].the2018
 
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
