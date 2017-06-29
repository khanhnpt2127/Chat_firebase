//
//  LoginViewController.swift
//  Chat_Firebase
//
//  Created by TK Nguyen on 6/29/17.
//  Copyright © 2017 tknguyen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var PasswordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSignup(_ sender: Any) {
        Auth.auth().createUser(withEmail: usernameTF.text!, password:  usernameTF.text!, completion: { (user: User?, error: Error?) in
            if error == nil {
                // signup successfully, auto login and move to chatVC
                print("Sign Up Successful")
                
           
            } else {
                // login failed, display an alert
                
            }
        })
        

    }
    @IBAction func onLogin(_ sender: Any) {
        
        Auth.auth().signIn(withEmail:  usernameTF.text!, password:  usernameTF.text!) { (user: User?, error: Error?) in
            if error == nil {
                // login successfully, move to chatVC
                let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "chatVC") as! ChatViewController
                self.show(nextViewController, sender: nil)
//                let navigationController = UINavigationController(rootViewController: nextViewController)
//                
//                
//                self.navigationController?.present(navigationController, animated: true, completion: nil)
//            
            } else {
                // login failed, display an alert
            }
        }
        
        
       
        
        
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
