//
//  InsightTableViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/6/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit



class InsightData: Codable {
    let data: DataClass?
    let isLogin: Bool?
    
    enum CodingKeys: String, CodingKey {
        case data
        case isLogin = "is_login"
    }
    
    init(data: DataClass?, isLogin: Bool?) {
        self.data = data
        self.isLogin = isLogin
    }
}

class DataClass: Codable {
    let insight: [InsightArrayData]?
    
    init(insight: [InsightArrayData]?) {
        self.insight = insight
    }
}

class InsightArrayData: Codable {
    
    let id : String?
    let title: String?
    let description: String?
    let category_name: String?
    let post_datetime: String?
    let author: String?
    let impact: String?
    let readmore_link: String?
    let analyst: String?
    let post_image2: String?
    //let text5: String!
    let post_image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case category_name
        case post_datetime
        case author
        case impact
        case readmore_link
        case analyst
        case post_image2
        case post_image
        
    }
    init(id : String?, title : String?, description : String?, category_name : String?, post_datetime : String?, author : String?,analyst : String?, impact : String? , readmore_link : String?, post_image : String?, post_image2 : String?){
        self.id = id
        self.title = title
        self.description = description
        self.category_name = category_name
        self.post_datetime = post_datetime
        self.author = author
        self.impact = impact
        self.readmore_link = readmore_link
        self.analyst = analyst
        self.post_image = post_image
        self.post_image2 = post_image2
    }
}
// MARK: Convenience initializers

extension InsightData {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(InsightData.self, from: data)
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

extension DataClass {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(DataClass.self, from: data)
        self.init(insight: me.insight)
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
extension InsightArrayData{
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(InsightArrayData.self, from: data)
        self.init(id: me.id, title : me.title , description : me.description, category_name: me.category_name, post_datetime : me.post_datetime, author : me.author, analyst: me.analyst, impact : me.impact, readmore_link : me.readmore_link, post_image: me.post_image, post_image2: me.post_image2)
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

class InsightTableViewController: UITableViewController {
    @IBOutlet var insightTableview: UITableView!
  //  var InsightDataArray1 = [InsightArrayData]()
    var InsightDataArray = [InsightArrayData]()
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
                let insightData = try decoder.decode(InsightData.self, from: data)
              //  print(insightData1.data?.insight![0].title)
               self.InsightDataArray = (insightData.data?.insight)!
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
        cell.publishbyName.text = InsightDataArray[indexPath.row].category_name
        cell.analystName.text = InsightDataArray[indexPath.row].author
        
        
        if let imageURL = URL(string: InsightDataArray[indexPath.row].post_image!) {
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
        let separated = InsightDataArray[indexPath.row].post_datetime?.split(separator: " ")
        
        if let some = separated?.first {
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
        let detailnews = storyboard?.instantiateViewController(withIdentifier: "innerpage") as! insightNews
        
        detailnews.titles = InsightDataArray[indexPath.row].title!
        detailnews.descriptions = InsightDataArray[indexPath.row].description!
        if InsightDataArray[indexPath.row].category_name != nil {
        detailnews.category = InsightDataArray[indexPath.row].category_name!
        } else{
            detailnews.analyst = "none1"
        }
        detailnews.analyst = InsightDataArray[indexPath.row].analyst!
        detailnews.author = InsightDataArray[indexPath.row].author!
        detailnews.banner = InsightDataArray[indexPath.row].post_image!
        detailnews.date = InsightDataArray[indexPath.row].post_datetime!
        detailnews.post_image2 = InsightDataArray[indexPath.row].post_image2!
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
