import UIKit
import CLTypingLabel

class MainVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var logoLabel: CLTypingLabel!
    
    // MARK: - Objects
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        logoLabel.text = "<-OneToOne:->"
    }
    
    // MARK: - IBActions
    @IBAction func registerButtonPressed(_ sender: UIButton) {}
    @IBAction func loginButtonPressed(_ sender: UIButton) {}
}
