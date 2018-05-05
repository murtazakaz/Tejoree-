//
//  NewsDetailViewController.swift
//  Tejoree
//
//  Created by Macbook on 1/27/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

   var category = ""
   var impact = ""
   var date = ""
   var banner = ""
   var titles = ""
   var descriptions = ""
    
    @IBOutlet weak var ban_image: UIImageView!
    @IBOutlet weak var cat_text: UILabel!
    @IBOutlet weak var impact_text: UILabel!
    @IBOutlet weak var date_text: UILabel!
    @IBOutlet weak var title_text: UILabel!
    @IBOutlet weak var desc_text: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if banner == ""{
            self.ban_image.image = #imageLiteral(resourceName: "no-image")
        }
        else {
        if let imageURL = URL(string: banner) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.ban_image.image = image
                    }
                }
            }
        }
        }
        
        let separated = date.split(separator: " ")
        
        if let some = separated.first {
            let value = String(some)
             date_text.text = value//news[indexPath.row].post_datetime
            // Output: "some"
        }
        
        if impact == "-"{
            impact_text.text = "Negative"//news[indexPath.row].impact
           impact_text.textColor = UIColor.red
        }else {
            impact_text.text = "Positive"
            
        }
        cat_text.text = category
        title_text.text = titles
        desc_text.text = descriptions
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
