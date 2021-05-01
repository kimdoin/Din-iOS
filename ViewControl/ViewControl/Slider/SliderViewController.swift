

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var aSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    @IBOutlet weak var cSlider: UISlider!
    
    
    @IBAction func sliderChanged(_ sender: Any) {
        let a = CGFloat(aSlider.value)
        let b = CGFloat(bSlider.value)
        let c = CGFloat(cSlider.value)
        
        let color = UIColor(red: a, green: b, blue: c, alpha: 1.0)
        view.backgroundColor = color
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 코드에서 value값 변경하는방법
        aSlider.value = 1.0
        bSlider.value = 1.0
        cSlider.value = 1.0
        
        // 애니메이션 효과를 적용하고 싶다면
//        aSlider.setValue(<#T##value: Float##Float#>, animated: <#T##Bool#>)
        
        // 코드에서 범위를 지정하는 방법
        //aSlider.minimumValue = 0.0
        //aSlider.maximumValue = 1.0

    }
    
}
