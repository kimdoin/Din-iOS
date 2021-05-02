import UIKit

class SlotMachinePickerViewController: UIViewController {

    
    lazy var images: [UIImage] = {
        return (0...6).compactMap { UIImage(named: "slot-machine-\($0)") }
    }()
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func start(_ sender: Any?) {
        let firstIndex = Int.random(in: 0..<images.count) + images.count
        let secondIndex = Int.random(in: 0..<images.count) + images.count
        let thridIndex = Int.random(in: 0..<images.count) + images.count
        
        picker.selectRow(firstIndex, inComponent: 0, animated: true)
        picker.selectRow(secondIndex, inComponent: 1, animated: true)
        picker.selectRow(thridIndex, inComponent: 2, animated: true)
        checkWin()
    }
    
    func checkWin() {
        var set = Set<Int>()
        
        (0...2).forEach {
            set.insert(picker.selectedRow(inComponent: $0) % images.count)
        }
        
        if set.count == 1 {
            let alert = UIAlertController(title: "당첨", message: "Win!!!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.isUserInteractionEnabled = false
        picker.reloadAllComponents()
        start(nil)
    }
}

extension SlotMachinePickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count * 3
    }
}

extension SlotMachinePickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if let imageView = view as? UIImageView {
            imageView.image = images[row % images.count]
            return imageView
        }
        let imageView = UIImageView()
        imageView.image = images[row % images.count]
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
}
