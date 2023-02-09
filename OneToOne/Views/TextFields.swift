import UIKit
class TextFields: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.masksToBounds = true
        layer.cornerRadius = frame.size.height / 5
        layer.shadowOpacity = 0.4
    }
}
