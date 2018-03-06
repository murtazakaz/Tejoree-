//
//  SignupViewController.swift
//  Tejoree
//
//  Created by Macbook on 12/13/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit
import TextFieldEffects
class Register: Codable {
    let success: Bool
    let message: [String]
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case message = "message"
    }
    
    init(success: Bool, message: [String]) {
        self.success = success
        self.message = message
    }
}

// MARK: Convenience initializers

extension Register {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Register.self, from: data)
        self.init(success: me.success, message: me.message)
    }
    
    convenience init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    convenience init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

class SignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstname: HoshiTextField!
    @IBOutlet weak var lastname: HoshiTextField!
    @IBOutlet weak var email: HoshiTextField!
    @IBOutlet weak var mobilecode: HoshiTextField!
    @IBOutlet weak var mobilenumber: HoshiTextField!
    @IBOutlet weak var password: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func Signup(_ sender: Any) {
        print(self.firstname.text,
              self.lastname.text,
              self.email.text,
              self.mobilecode.text,
              self.mobilenumber.text,
              self.password.text)
        
        if self.firstname.text == ""{
            let alert = UIAlertController(title: "Failed" , message: "Please provide First Name"    , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
           
            self.present(alert, animated: true)
        }
        else if self.lastname.text == ""{
            let alert = UIAlertController(title: "Failed" , message: "Please provide Last Name"    , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
         else if self.email.text == ""{
            let alert = UIAlertController(title: "Failed" , message: "Please provide Email"    , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
         else if self.mobilecode.text == ""{
            let alert = UIAlertController(title: "Failed" , message: "Please provide Mobile Code"    , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
         else if self.mobilenumber.text == ""{
            let alert = UIAlertController(title: "Failed" , message: "Please provide Mobile Number"    , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
         else if self.password.text == ""{
            let alert = UIAlertController(title: "Failed" , message: "Please provide Password"    , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        else {
        
        let first = "firstname="+self.firstname.text!
        let last = "&lastname="+self.lastname.text!;
        let mob = "&mobile="+self.mobilecode.text!+self.mobilenumber.text!;
        let pass = "&password="+self.password.text!
        let em = "&email="+self.email.text!;
      
        guard let myUrl = URL(string: "http://videostreet.pk/tejori/tjApi/getSignUp/") else { return }
        var request = URLRequest(url:myUrl)
        request.addValue("876564123", forHTTPHeaderField: "X-TJ-APIKEY")
        request.httpMethod = "POST"// Compose a query string
        
       
        request.httpBody = first.data(using: String.Encoding.utf8)!+last.data(using: String.Encoding.utf8)!+mob.data(using: String.Encoding.utf8)!+pass.data(using: String.Encoding.utf8)!+em.data(using: String.Encoding.utf8)!;
      
print(request)
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            print("signup")
            print(data)
            
            
          do
            {
                let decoder = JSONDecoder()
                let data = try decoder.decode(Register.self, from: data)
                print(data.success, data.message)
                
                //   self.commoditiesArray = commoditiesres.data
                //   print(self.commoditiesArray[0].name)
                DispatchQueue.main.async {
                  
                    //   self.tableView.reloadData()
                    if data.success == true{
                    let alertController = UIAlertController(title: "Sign Up", message:
                        data.message[0], preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: { action in
                          //  let detailnews = storyboard?.instantiateViewController(withIdentifier: "login")
                            self.navigationController?.popViewController(animated: true)
                        }))
                    
                    self.present(alertController, animated: true, completion: nil)
                    }else {
                        let alertController = UIAlertController(title: "Sign Up", message:
                            data.message[0], preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default,handler: nil))
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            } catch {
                print(error)
            }
 
            }.resume()
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
