//
//  ViewController.swift
//  Tejoree
//
//  Created by Macbook on 11/20/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if (navigationController?.topViewController != self) {
            navigationController?.navigationBar.isHidden = false
        }
        super.viewWillDisappear(animated)
    }
    
    //HIDE KEYBOARD
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return (true)
    }*/

}

