import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginVC: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Objects
    var delegate: UITextFieldDelegate?
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.delegate = self
        passwordTF.delegate = self
    }
    
    // MARK: - IBActions
    
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        if sender.text!.count < 6 {
            loginButton.layer.backgroundColor = #colorLiteral(red: 1, green: 0.3921568627, blue: 0.3921568627, alpha: 0.8964710884)
            loginButton.isEnabled = false
        } else {
            loginButton.layer.backgroundColor = #colorLiteral(red: 0.337254902, green: 0.4431372549, blue: 0.537254902, alpha: 0.7983365221)
            loginButton.isEnabled = true
        }
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailTF.text, let password = passwordTF.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}
// MARK: - Extensions

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
