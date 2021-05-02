import UIKit

class DatePieckViewController: UIViewController {

    @IBOutlet weak var picker: UIDatePicker!
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        print(sender.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.datePickerMode = .date
        picker.locale = Locale(identifier: "ko_kr")
        picker.minuteInterval = 1
        picker.date = Date()
        
        picker.setDate(Date(), animated: true) // 날짜를 설정할때 애니메이션 효과를 적용하고 싶다면 setDate 속성을 사용
        //    picker.minimumDate
        //    picker.maximumDate
        //    picker.countDownDuration = 60
            
            // 캘린더와 타임존 속성은 코드로만 설정할 수 있다.
        //    picker.calendar
        //    picker.timeZone
    }
}
