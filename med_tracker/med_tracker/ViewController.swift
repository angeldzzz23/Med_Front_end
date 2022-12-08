//
//  ViewController.swift
//  med_tracker
//
//  Created by Angel Zambrano on 10/21/22.
//

import UIKit

struct LogIn: Codable {
    let jwt: String?
}

struct User: Codable {
    let id: Int?
    let name, email: String?
}



class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    
    @IBOutlet weak var passwordtxtfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        UserDefaults.standard.set(true, forKey: "userLoggedIn")
//        self.performSegue(withIdentifier: "loginToHome", sender: self)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        
        defaults.set("Sheep787", forKey: "Password")

        let email = defaults.string(forKey: "email")
        let password =  defaults.string(forKey: "Password")
        let lol =  defaults.string(forKey: "lol")
        print("email", email)
        print("password", password)
        
        if let email = email, let password = password {
            //
            API.logIn(email: email, password: password) { result in
                switch result {
                case .success(let logIn):
                    DispatchQueue.main.async {
                       
                        self.performSegue(withIdentifier: "loginToHome", sender: self)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            
            }
        }
    
        
        
        
    }
    
    @IBAction func LoginButtonWasPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordtxtfield.text {
            
            
            
            
            API.logIn(email: email, password: password) { result in
                switch result {
                case .success(let logIn):
                    if logIn?.jwt == nil {
                        print("password is incorrect")
                    } else {
                        let defaults = UserDefaults.standard
                        defaults.set(email, forKey:"email")
                        defaults.set(password, forKey:"Password")
                        defaults.set(false, forKey: "lol")
                        
                        DispatchQueue.main.async {
                           
                            self.performSegue(withIdentifier: "loginToHome", sender: self)
                        }
                    }
           
                    
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        
        
    }
    


}

