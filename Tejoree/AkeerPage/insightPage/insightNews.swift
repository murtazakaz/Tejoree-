//
//  insightNews.swift
//  Tejoree
//
//  Created by Macbook on 4/25/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class insightNews: UIViewController {
    
    var category = ""
    var impact = ""
    var date = ""
    var banner = ""
    var titles = ""
    var descriptions = ""
    var author = ""
    var post_image2 = ""
    var analyst = ""
    @IBOutlet weak var ban_image: UIImageView!
    @IBOutlet weak var post_image: UIImageView!
    @IBOutlet weak var industry: UILabel!
    @IBOutlet weak var analysttext: UILabel!
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var desc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if category=="" { self.industry.text = "None"}
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
        
       
   
      
        industry.text = category
        topic.text = titles
        desc.text = descriptions
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
