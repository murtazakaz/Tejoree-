//
//  InsightTableViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/6/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

struct InsightCellData{
    let cell : Int!
    let title: String!
    let publishdate: String!
    let publisher: String!
    let analyst: String!
    //let text5: String!
    let thumbnailimage: UIImage!
}

class InsightTableViewController: UITableViewController {
 var arrayofdata = [InsightCellData]()
    override func viewDidLoad() {
        super.viewDidLoad()

        arrayofdata = [InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader"))
                       ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayofdata.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("InsightRowTableViewCell", owner: self, options: nil)?.first as! InsightRowTableViewCell
        cell.title.text = arrayofdata[indexPath.row].title
        cell.publishDate.text = arrayofdata[indexPath.row].publishdate
        cell.publishbyName.text = arrayofdata[indexPath.row].publisher
        cell.analystName.text = arrayofdata[indexPath.row].analyst
        cell.thumbnailImage.image = arrayofdata[indexPath.row].thumbnailimage
        
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
            return 90
       
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailnews = storyboard?.instantiateViewController(withIdentifier: "innerpage")
        navigationController?.pushViewController( detailnews!, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

