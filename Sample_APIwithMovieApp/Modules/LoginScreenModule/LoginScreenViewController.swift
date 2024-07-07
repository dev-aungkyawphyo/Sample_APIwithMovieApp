//
//  LoginScreenViewController.swift
//  Sample_APIwithMovieApp
//
//  Created by Aung Kyaw Phyo on 07/07/2024.
//

import UIKit
import GoogleSignIn

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var loginInWithGoogleBtn: UIButton!
    @IBOutlet weak var loginInWithFbBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

// MARK: - Extensions

// MARK: - UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    
}

// MARK: - @IBAction
extension LoginScreenViewController {
    @IBAction func didTappedLoginBtnAction(_ sender: UIButton) {
        
    }
    
    @IBAction func didTappedGoogleLoginBtnAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { GIDSignInResult, error in
            self.loginInWithGoogleBtn.isHidden = false
            self.loginInWithFbBtn.isHidden = false
            guard error == nil else { return }
            
            // If sign in succeeded, display the app's main content View.
            guard let signInResult = GIDSignInResult else { return }
            let user = signInResult.user
            let emailAddress = user.profile?.email
            let fullName = user.profile?.name
            let familyName = user.profile?.familyName
            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController")
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func didTappedFbLoginBtnAction(_ sender: UIButton) {
        
    }
}

//extension LoginScreenViewController:

