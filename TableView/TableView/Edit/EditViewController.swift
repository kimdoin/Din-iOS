
import UIKit

class EditViewController: UIViewController {

    var editingSwitch: UISwitch!
    @IBOutlet weak var listTableView: UITableView!
    
    var numberList = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var selectedList = [String]()
    
    @objc func toggleEditMode(_ sender: UISwitch) {
        listTableView.setEditing(sender.isOn, animated: true)
    }
    
    @objc func emptyList() {
        numberList.append(contentsOf: selectedList)
        selectedList.removeAll()
        
        listTableView.reloadSections(IndexSet(integersIn: 0...1), with: .automatic)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editingSwitch = UISwitch(frame: .zero)
        editingSwitch.addTarget(self, action: #selector(toggleEditMode(_:)), for: .valueChanged)
        
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(emptyList))
        deleteButton.tintColor = UIColor.red
        
        navigationItem.rightBarButtonItems = [deleteButton, UIBarButtonItem(customView: editingSwitch)]
        
        editingSwitch.isOn = listTableView.isEditing
    }
}

extension EditViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return selectedList.count
        case 1:
            return numberList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "선택 목록"
        case 1:
            return "숫자 목록"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 사용자가 삭제 버튼이나 추가 버튼을 탭하면 이 메소드가 호출됨
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            let target = numberList[indexPath.row]
            
            let insertIndexPath = IndexPath(row: selectedList.count, section: 0)
            
            selectedList.append(target)
            numberList.remove(at: indexPath.row)
            
            listTableView.performBatchUpdates {
                [weak self] in
                self?.listTableView.insertRows(at: [insertIndexPath], with: .automatic)
                self?.listTableView.deleteRows(at: [indexPath], with: .automatic)
            } completion: { finished in
                
            }

            
        case .delete:
            let target = selectedList[indexPath.row]
            let insertIndexPath = IndexPath(row: numberList.count, section: 1)
            
            numberList.append(target)
            numberList.remove(at: indexPath.row)
            
            listTableView.performBatchUpdates {
                [weak self] in
                self?.listTableView.insertRows(at: [insertIndexPath], with: .automatic)
                self?.listTableView.deleteRows(at: [indexPath], with: .automatic)
            } completion: { finished in
                
            }

        default:
            break
        }
    }
}

extension EditViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        switch indexPath.section {
        case 0:
            return .delete
        case 1:
            return .insert
        default:
            return .none
        }
    }
    
    // 이 메소드는 Swipe to delete가 실행되기 전에 실행됨
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        editingSwitch.setOn(true, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        editingSwitch.setOn(false, animated: false)
    }

    // 삭제 타이틀 변경
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }
}

