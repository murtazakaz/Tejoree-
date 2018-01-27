//
//  TableViewController.swift
//  Tejoree
//
//  Created by Macbook on 11/22/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class News : Codable {
    let data: [newsArray]
    
    init(data: [newsArray]) {
        self.data = data
    }
}
class newsArray: Codable {
    
    let id: String
    let title: String
    let description: String
    let category_name: String
    let post_datetime: String
    let author : String
    let post_image: String
    let impact: String
    
    init( id: String, title: String, description: String, category_name: String ,post_datetime: String, author : String, post_image: String, impact: String) {
        self.id = id
        self.title = title
        self.description = description
        self.category_name = category_name
        self.post_datetime =  post_datetime
        self.author = author
        self.post_image = post_image
        self.impact = impact
    }
}



class TableViewController: UITableViewController {
    
   
   
   private var news = [newsArray]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //  downloadJson()
        post()
   
        
    }
   /* func downloadJson() {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            print("downloaded")
            do
            {
                let decoder = JSONDecoder()
                let downloadedActors = try decoder.decode(News.self, from: data)
                self.news = downloadedActors.data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("something wrong after downloaded")
            }
            }.resume()
    } */
    func post(){
        guard let myUrl = URL(string: "http://videostreet.pk/tejori/tjApi/getCategoryData/") else { return }
        var request = URLRequest(url:myUrl)
        request.addValue("876564123", forHTTPHeaderField: "X-TJ-APIKEY")
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "category_id=1&category_type_id=1";
        
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
                let newsdata = try decoder.decode(News.self, from: data)
                self.news = newsdata.data
                //print(self.news[0].id)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("something wrong after downloaded")
            }
        }.resume()
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
      
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if news[indexPath.row].id == "1"{
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            if let imageURL = URL(string: news[indexPath.row].post_image) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.banner.image = image
                        }
                    }
                }
                
            }
            
          //  cell.banner.image = arrayofdata[indexPath.row].image
            let separated = news[indexPath.row].post_datetime.split(separator: " ")
            
            if let some = separated.first {
                let value = String(some)
                 cell.name3.text = value//news[indexPath.row].post_datetime
                // Output: "some"
            }
            if news[indexPath.row].impact == "-"{
                cell.name2.text = "Negative"//news[indexPath.row].impact
                 cell.name2.textColor = UIColor.red
            }else {
                cell.name2.text = "Positive"
                }
            
            cell.name1.text = news[indexPath.row].category_name
           // cell.name2.text = news[indexPath.row].impact
            cell.title.text = news[indexPath.row].title
            cell.detail.text = news[indexPath.row].description
            
            return cell
            
        } else {
            
            let cell2 = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
                if let imageURL = URL(string: news[indexPath.row].post_image) {
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: imageURL)
                        if let data = data {
                            let image = UIImage(data: data)
                            DispatchQueue.main.async {
                               
                               cell2.thumbnail.image = image
                            }
                        }
                    }
                }
            
            let separated = news[indexPath.row].post_datetime.split(separator: " ")
            
            if let some = separated.first {
                let value = String(some)
                 cell2.datetext.text = value//news[indexPath.row].post_datetime
                // Output: "some"
            }
            
            if news[indexPath.row].impact == "-"{
                 cell2.type2.text = "Negative"//news[indexPath.row].impact
                cell2.type2.textColor = UIColor.red
            }else {
                 cell2.type2.text = "Positive"
                
            }
            
            cell2.type1.text = news[indexPath.row].category_name
            cell2.Title.text = news[indexPath.row].title
            
            return cell2
            
        }
        
            
        }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if news[indexPath.row].id == "1"{
           
            return 338        }
        else{
           
            return 90
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailnews = storyboard?.instantiateViewController(withIdentifier: "newsinsights") as! NewsDetailViewController
        detailnews.category = news[indexPath.row].category_name
        detailnews.impact = news[indexPath.row].impact
        detailnews.date = news[indexPath.row].post_datetime
        detailnews.banner = news[indexPath.row].post_image
        detailnews.titles = news[indexPath.row].title
        detailnews.descriptions = news[indexPath.row].description
        navigationController?.pushViewController( detailnews, animated: true)
        
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
