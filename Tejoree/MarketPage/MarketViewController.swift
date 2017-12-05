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
class MarketViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
   
     var arrayofdata = [MarketSnapShotData]()

  
    @IBOutlet weak var marketDataSnapShotsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
            return 69
       
    }
    
    @IBAction func MarketDataSnapshotsSwitch(_ sender: UISegmentedControl) {
    }
    
}