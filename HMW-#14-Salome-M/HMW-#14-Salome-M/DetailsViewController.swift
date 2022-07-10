//
//  DetailsViewController.swift
//  HMW-#14-Salome-M
//
//  Created by Mcbook Pro on 10.07.22.
//

import UIKit
//import BLTNBoard


class DetailsViewController: UIViewController {
    
    let toSelect = "toSignIn"
    
    var usernameFromLogInPage: String?
    var mailFromLogInPage: String?

    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var complition: ( (String,String)-> ())?
    
    
//    private lazy var boardManager: BLTNItemManager = {
//        let item = BLTNPageItem(title: "Log Out" )
//        item.actionButtonTitle = "Yes"
//        item.alternativeButtonTitle = "No"
//        item.descriptionText = "Are you sure you want log out?"
//
//        item.actionHandler = { _ in
//            DetailsViewController.didTapBoardYes()
//
//        }
//
//        item.alternativeHandler = { _ in
//
//        }
//
//        return BLTNItemManager(rootItem: item)
//    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = usernameFromLogInPage
        emailLabel.text = mailFromLogInPage
    }
    
    
    @IBAction func withTablePressed(_ sender: Any) {
//        boardManager.showBulletin(above: self)
       let VC = UIViewController()
        VC.view.backgroundColor = .white
        
        if let sheet = VC.sheetPresentationController{
            sheet.detents = [.medium()]
        }
        
        let button = UIButton(frame: CGRect(x: 100, y: 350, width: 200, height: 50))
        button.setTitle("yes", for: .normal)
        button.backgroundColor = .green
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
       
        
        VC.view.addSubview(button)
        

        present(VC, animated: true)
       
    }
    
    @objc func buttonTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        
        
        present(nextViewController, animated:true, completion:nil)
    }
    
    static func didTapBoardYes(){
       
    
    }
    static func didTapBoardNo(){
        
    }
    

}


