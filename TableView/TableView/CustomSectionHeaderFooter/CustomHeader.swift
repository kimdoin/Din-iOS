import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var customBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        countLabel.text = "0"
        countLabel.layer.cornerRadius = 30
        countLabel.clipsToBounds = true
        
        backgroundView = customBackgroundView
    }
}

