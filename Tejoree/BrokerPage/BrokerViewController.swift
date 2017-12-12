//
//  BrokerViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/6/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit
struct BrokerCellData{
    let cell : Int!
    let title: String!
    let publishdate: String!
    let publisher: String!
    let analyst: String!
    //let text5: String!
    let thumbnailimage: UIImage!
}
class BrokerViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var BrokerTableView: UITableView!
    var arrayofdata = [BrokerCellData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayofdata = [BrokerCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),BrokerCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),BrokerCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),BrokerCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),BrokerCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),BrokerCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),BrokerCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),BrokerCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),BrokerCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),BrokerCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader"))
        ]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayofdata.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("InsightRowTableViewCell", owner: self, options: nil)?.first as! InsightRowTableViewCell
        cell.title.text = arrayofdata[indexPath.row].title
        cell.publishDate.text = arrayofdata[indexPath.row].publishdate
        cell.publishbyName.text = arrayofdata[indexPath.row].publisher
        cell.analystName.text = arrayofdata[indexPath.row].analyst
        cell.thumbnailImage.image = arrayofdata[indexPath.row].thumbnailimage
        
        // Configure the cell...
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
        
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailnews = storyboard?.instantiateViewController(withIdentifier: "innerpage")
        navigationController?.pushViewController( detailnews!, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
