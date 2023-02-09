import UIKit
class ViewBlocks: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.masksToBounds = true
        layer.cornerRadius = layer.frame.size.height / 5
        layer.shadowOpacity = 0.3
    }
}
