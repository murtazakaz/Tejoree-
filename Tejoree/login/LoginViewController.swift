//
//  LoginViewController.swift
//  Tejoree
//
//  Created by Macbook on 3/7/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit
import TextFieldEffects

struct Login: Codable {
    let success: Bool
    let message: [String]
}

// MARK: Convenience initializers
extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
extension Login {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Login.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

class LoginViewController: UIViewController {

    @IBOutlet weak var email: HoshiTextField!
    @IBOutlet weak var password: HoshiTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func fblogin(_ sender: Any) {
        let sv = UIViewController.displaySpinner(onView: self.view)
        FacebookSignInManager.basicInfoWithCompletionHandler(self) { (dataDictionary:Dictionary<String, AnyObject>?, error:NSError?) -> Void in
            print("success")
            print(dataDictionary?["name"])
            if(dataDictionary?["name"] == nil){
                 UIViewController.removeSpinner(spinner: sv)
          print("error fb")
            }else{
                let news = self.storyboard?.instantiateViewController(withIdentifier: "homepage")
                
                self.navigationController?.pushViewController( news!, animated: true)
                UIViewController.removeSpinner(spinner: sv)
            }
        }
    }
    @IBAction func signin(_ sender: Any) {
        
     
        if self.email.text == ""{
            
            let alert = UIAlertController(title: "Failed" , message: "Please provide Email"    , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        else if self.password.text == ""{
            let alert = UIAlertController(title: "Failed" , message: "Please provide Password"    , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        } else {
            
        
            let pass = "&password="+self.password.text!
            let em = "&email="+self.email.text!;
            
            let sv = UIViewController.displaySpinner(onView: self.view)
            
            guard let myUrl = URL(string: "http://videostreet.pk/tejori/tjApi/getLoggedIn") else { return }
            var request = URLRequest(url:myUrl)
            request.addValue("876564123", forHTTPHeaderField: "X-TJ-APIKEY")
            request.httpMethod = "POST"// Compose a query string
            
            
            request.httpBody = pass.data(using: String.Encoding.utf8)!+em.data(using: String.Encoding.utf8)!;
            
            print(request)
            URLSession.shared.dataTask(with: request) { data, urlResponse, error in
                guard let data = data, error == nil, urlResponse != nil else {
                   
                  UIViewController.removeSpinner(spinner: sv)
                    let alertController = UIAlertController(title: "", message:
                        "Slow or No Internet", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default,handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                    print("something is wrong")
                    return
                }
                 UIViewController.removeSpinner(spinner: sv)
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
                         	
                            let news = self.storyboard?.instantiateViewController(withIdentifier: "homepage")
                            
                            self.navigationController?.pushViewController( news!, animated: true)
                            
                        }else {
                            let alertController = UIAlertController(title: "Login", message:
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }}
