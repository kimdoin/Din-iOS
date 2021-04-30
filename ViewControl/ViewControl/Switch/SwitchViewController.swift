import UIKit

class SwitchViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lightSwitch: UISwitch!
    
    @IBAction func onOff(_ sender: Any) {
        if lightSwitch .isOn {
            imageView.image = UIImage(named: "on")
            label.text = "불꺼줘"
        } else {
            imageView.image = UIImage(named: "off")
            label.text = "불켜줘"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
