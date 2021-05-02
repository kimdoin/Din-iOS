import UIKit

class ActivityIndicatorViewController: UIViewController {

    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    
    @IBAction func start(_ sender: Any) {
        if !loader.isAnimating {
            loader.startAnimating()
        }
    }
    
    
    @IBAction func stop(_ sender: Any) {
        if loader.isAnimating {
            loader.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loader.startAnimating()
    }
}
