import UIKit

class MainVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var logoLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        let appName = "OneToOne"
        logoLabel.text = ""
        var charIndex = 0.0
        for letter in K.appName {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.logoLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    // MARK: - IBActions
    @IBAction func registerButtonPressed(_ sender: UIButton) {}
    @IBAction func loginButtonPressed(_ sender: UIButton) {}
}
