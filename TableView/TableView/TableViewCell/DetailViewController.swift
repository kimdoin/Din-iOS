import UIKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var valueImage: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!
    

    var value: String?
    var image: UIImage?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        valueImage.image = image
        valueLabel.text = value
    }
}
