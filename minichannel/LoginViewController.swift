//
//  LoginViewController.swift
//  minichannel
//
//  Created by nagasaka.shogo on 1/18/17.
//  Copyright © 2017 jp.ne.donuts. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, GIDSignInUIDelegate {
  
  @IBOutlet var signInButton: GIDSignInButton?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    // ここに認証チェックを追加する
    GIDSignIn.sharedInstance().uiDelegate = self
    FIRAuth.auth()?.addStateDidChangeListener { auth, user in
      if user != nil {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let nc: UINavigationController = mainStoryboard.instantiateViewController(withIdentifier: "nc") as? UINavigationController {
          self.present(nc, animated: true, completion: nil)
        }
        
        
      }
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
}
