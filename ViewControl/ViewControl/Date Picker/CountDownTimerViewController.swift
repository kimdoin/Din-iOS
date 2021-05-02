import UIKit
import AudioToolbox

class CountDownTimerViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var picker: UIDatePicker!
    
    var remainingSeconds = 0 // 남은 시간 저장할 속성 선언, 0으로 초기화
    
    @IBAction func start(_ sender: Any) {
        timeLabel.text = "\(Int(picker.countDownDuration))"
        remainingSeconds = Int(picker.countDownDuration)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.remainingSeconds -= 1
            self.timeLabel.text = "\(self.remainingSeconds)"
            // repeats -> false를 전달하면 1번만 실행하고 종료
            
            if self.remainingSeconds == 0 {
                timer.invalidate()
                AudioServicesPlaySystemSound(1315)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.countDownDuration = 60
    }
}
