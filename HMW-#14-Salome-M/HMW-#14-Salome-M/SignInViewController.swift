//
//  SignInViewController.swift
//  HMW-#14-Salome-M
//
//  Created by Mcbook Pro on 09.07.22.
//

import UIKit



class SignInViewController: UIViewController {
    private let toSelect = "toSelect"
    
    @IBOutlet weak var userNameTextFiled: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    
    // Received data
    
    private var usernameStored: String?
    private var passwordStored: String?
    private var maildStored: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toSelect {
            if let selectVC = segue.destination as?  RegistrationViewController{
                
                selectVC.complition = { [weak self] username, password, mail in
                    
                    guard let self = self else { return }
                    self.usernameStored = username
                    self.passwordStored = password
                    self.maildStored = mail
                    
                }
            }
        }
    }
    
    @IBAction func verificationButton(_ sender: Any) {
     
        if userNameTextFiled.text ==  self.usernameStored  &&   passwordTextField.text ==  self.passwordStored {
            
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsView") as! DetailsViewController
            nextViewController.usernameFromLogInPage = usernameStored
            nextViewController.mailFromLogInPage = maildStored
            
            self.present(nextViewController, animated:true, completion:nil)
            
        }else {
            
            let myAlert =  UIAlertController(title: "", message: "incorect creditial" , preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            myAlert.addAction(okAction)
            
            present(myAlert, animated: true)
            
        }
            
    }
    
}
