//
//  TableViewController.swift
//  Tejoree
//
//  Created by Macbook on 11/22/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit
struct cellData{
    let cell : Int!
    let text1: String!
    let text2: String!
    let text3: String!
    let text4: String!
    let text5: String!
    let image: UIImage!
}
class TableViewController: UITableViewController {
    
    var arrayofdata = [cellData]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
       /*let cellNib = UINib(nibName: "TableViewCell1", bundle: nil)
       self.tableView.register(cellNib, forCellReuseIdentifier: cellIndentifier)
 */
        arrayofdata = [cellData(cell:1, text1:"POLITICS",text2: "NEGATIVE",text3: "05-11-2017",text4:"Protester interrupts Theresa May's keynoteProtester interrupts Theresa May's keynote Protester interrupts Theresa May's keynoteProtester interrupts Theresa May's keynote Protester interrupts Theresa May's keynoteProtester interrupts Theresa May's keynote",text5:"Protester interrupts Theresa May's keynoteProtester interrupts Theresa May's keynote Protester interrupts Theresa May's keynoteProtester interrupts Theresa May's keynote Protester interrupts Theresa May's keynoteProtester interrupts Theresa May's keynote", image: #imageLiteral(resourceName: "tableheader")),
        cellData(cell:2, text1:"Politics",text2:"Negative",text3: "05-11-2017",text4:"Protester interrupts Theresa May's keynoteProtester interrupts Theresa May's keynote Protester interrupts Theresa May's keynoteProtester interrupts Theresa May's keynote Protester interrupts Theresa May's keynoteProtester interrupts Theresa May's keynote",text5:"this is sample text", image: #imageLiteral(resourceName: "tableheader")),
        cellData(cell:2, text1:"Politics",text2:"Negative",text3: "05-11-2017",text4:"Protester interrupts Theresa",text5:"this is sample text", image: #imageLiteral(resourceName: "tableheader")),cellData(cell:2, text1:"Politics",text2:"Negative",text3: "05-11-2017",text4:"Protester interrupts Theresa",text5:"this is sample text", image: #imageLiteral(resourceName: "tableheader")),]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   /* override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
 */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayofdata.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayofdata[indexPath.row].cell == 1{
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            cell.banner.image = arrayofdata[indexPath.row].image
            cell.name1.text = arrayofdata[indexPath.row].text1
            cell.name2.text = arrayofdata[indexPath.row].text2
            cell.name3.text = arrayofdata[indexPath.row].text3
            cell.title.text = arrayofdata[indexPath.row].text4
            cell.detail.text = arrayofdata[indexPath.row].text5
            return cell
        } else {
            let cell2 = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            cell2.thumbnail.image = arrayofdata[indexPath.row].image
            cell2.type1.text = arrayofdata[indexPath.row].text1
            cell2.type2.text = arrayofdata[indexPath.row].text2
            cell2.datetext.text = arrayofdata[indexPath.row].text3
            cell2.Title.text = arrayofdata[indexPath.row].text4
            return cell2
            
        }
        
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayofdata[indexPath.row].cell == 1{
           
            return 338        }
        else{
           
            return 90
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailnews = storyboard?.instantiateViewController(withIdentifier: "newsinsights")
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
