import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    // MARK: - Objects
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
