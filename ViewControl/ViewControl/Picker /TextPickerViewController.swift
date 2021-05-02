
import UIKit

class TextPickerViewController: UIViewController {

    let apple = ["아이폰", "아이패드", "애플워치", "맥북", "맥북 에어", "아이맥", "아이맥 프로", "에어팟"]
    let fruits = ["사과", "딸기", "바나나", "키위", "메론", "복숭아", "망고", "포도", "오렌지"]
    
    @IBOutlet weak var picker: UIPickerView!
        
    @IBAction func report(_ sender: Any) {
        let firstSelectedRow = picker.selectedRow(inComponent: 0)
        let secondSelectedRow = picker.selectedRow(inComponent: 1)
        
        if firstSelectedRow >= 0, secondSelectedRow >= 0 {
            let alert = UIAlertController(title: "결과", message: "\(apple[firstSelectedRow]), \(fruits[secondSelectedRow])", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
}

extension TextPickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return apple.count
        case 1:
            return fruits.count
        default:
            return 0
        }
    }
}

extension TextPickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return apple[row]
        case 1:
            return fruits[row]
        default:
            return nil
        }
    }
}
