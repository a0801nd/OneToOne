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
            registerButton.layer.backgroundColor = #colorLiteral(red: 1, green: 0.3921568627, blue: 0.3921568627, alpha: 0.8964710884)
            registerButton.isEnabled = false
        } else {
            registerButton.layer.backgroundColor = #colorLiteral(red: 0.337254902, green: 0.4431372549, blue: 0.537254902, alpha: 0.7983365221)
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
