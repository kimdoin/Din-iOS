import UIKit

class ProgressViewController: UIViewController {

    @IBOutlet weak var progress: UIProgressView!
    

    @IBAction func update(_ sender: Any) {
        progress.setProgress(1.0, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progress.progress = 0.0
        progress.trackTintColor = UIColor.systemGray
        progress.progressTintColor = .black
        
    }
}
