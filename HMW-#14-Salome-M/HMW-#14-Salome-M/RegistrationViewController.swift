//
//  ViewController.swift
//  HMW-#14-Salome-M
//
//  Created by Mcbook Pro on 09.07.22.
//

import UIKit




class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepeatPassword: UITextField!
    

    
    var complition: ( (String,String,String)-> () )?
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        
       
        
    }


    @IBAction func signUpTapped(_ sender: Any) {
        let userName = txtUsername.text
        let userEmail = txtEmail.text
        let userPasword = txtPassword.text
        let userRepeatedPassword =  txtRepeatPassword.text
        
        //Pass the data via complition
        complition?(userName!, userPasword!, userEmail!)
        
       
        //check for empty fields
        if userName!.isEmpty || userEmail!.isEmpty || userPasword!.isEmpty {
            
        //display alert message
        displayAlertMessage("All fields are required")
            
        }
        
        //check if paswords match
        if userPasword != userRepeatedPassword {
            
        //display alert message
        displayAlertMessage("Passwords do not match")
            
        }
        
        // display alert message with confirmation
        let myAlert =  UIAlertController(title: "Alert", message: "Registration is successful. Thanks !" , preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default){ action in
             self.navigationController?.popToRootViewController(animated: true)
        }
        
        myAlert.addAction(okAction)
        present(myAlert, animated: true)
        
        
        
    }
    

    private  func displayAlertMessage(_ userMesage: String){
        
        let myAlert =  UIAlertController(title: "Alert", message: userMesage , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        
        present(myAlert, animated: true)
              
          }
    
    
}

