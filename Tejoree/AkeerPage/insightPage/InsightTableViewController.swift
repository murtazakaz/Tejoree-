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
    @IBOutlet var insightTableview: UITableView!
    var InsightDataArray = [Insight]()
    var rowcount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
            fetchInsight()
     /*   InsightDataArray = [InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader")),InsightCellData(cell:1, title:"Protester interrupts Theresa May's keynote Protester interrupts Theresa May's keynote", publishdate: "04-12-2017",publisher: "OIL",analyst:"Awais Aslam", thumbnailimage: #imageLiteral(resourceName: "tableheader"))
                       ] */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    func fetchInsight(){
        
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
                let insightData = try decoder.decode(Akseer.self, from: data)
              //  print(insightData.data.insight[0].title)
                self.InsightDataArray = insightData.data.insight
                //   self.commoditiesArray = commoditiesres.data
                //   print(self.commoditiesArray[0].name)
                DispatchQueue.main.async {
                  self.insightTableview.reloadData()
                 //   self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
            }.resume()
    }
    
  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if InsightDataArray.count == 0{
           self.rowcount = 0
        }
        else {
            self.rowcount = InsightDataArray.count
        }
         return self.rowcount
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("InsightRowTableViewCell", owner: self, options: nil)?.first as! InsightRowTableViewCell
        
   //     print("working")
        cell.title.text = InsightDataArray[indexPath.row].title
      //  cell.publishDate.text = InsightDataArray[indexPath.row].postDatetime
        cell.publishbyName.text = InsightDataArray[indexPath.row].categoryName
        cell.analystName.text = InsightDataArray[indexPath.row].author
     
        
        if let imageURL = URL(string: InsightDataArray[indexPath.row].postImage) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                       cell.thumbnailImage.image = image
                    }
                }
            }
            
        }
        
        //  cell.banner.image = InsightDataArray[indexPath.row].image
        let separated = InsightDataArray[indexPath.row].postDatetime.split(separator: " ")
        
        if let some = separated.first {
            let value = String(some)
            cell.publishDate.text = value//news[indexPath.row].post_datetime
            // Output: "some"
        }
     /*   if news[indexPath.row].impact == "-"{
            cell.name2.text = "Negative"//news[indexPath.row].impact
            cell.name2.textColor = UIColor.red
        }else {
            cell.name2.text = "Positive"
        }
       */
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

