import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Objects
    var delegate: UITextFieldDelegate?
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.delegate = self
        passwordTF.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let email = emailTF.text, let password = passwordTF.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    // A method that translates an error into the user's system language.
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        if sender.text!.count < 6 {
            registerButton.layer.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            registerButton.isEnabled = false
        } else {
            registerButton.layer.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.3019607843, blue: 0.4039215686, alpha: 1)
            registerButton.isEnabled = true
        }
    }
}
// MARK: - Extensions
extension RegisterVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
