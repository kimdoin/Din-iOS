import UIKit

class CustomSliderViewController: UIViewController {

    
    @IBOutlet weak var customSlider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        valueLabel.text = String(format: "%.1f", sender.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let img = UIImage(systemName: "lightbulb")
        customSlider.setThumbImage(img, for: .normal)
        customSlider.minimumTrackTintColor = UIColor.systemRed
        customSlider.maximumTrackTintColor = UIColor.black
        
//        customSlider.isContinuous = false
    }
}
