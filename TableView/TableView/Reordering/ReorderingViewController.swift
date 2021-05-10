import UIKit

class ReorderingViewController: UIViewController {

    var firstList = [String]()
    var secondList = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listTableView.setEditing(true, animated: true)
    }
    


}

extension ReorderingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return firstList.count
        case 1:
            return secondList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = firstList[indexPath.row]
        case 1:
            cell.textLabel?.text = secondList[indexPath.row]
        default:
            break
        }
        return cell
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "첫번째 목록"
        case 1:
            return "두번째 목록"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var target: String? = nil // 대상을 저장할 변수 선언
        switch sourceIndexPath.section {
        case 0:
            target = firstList.remove(at: sourceIndexPath.row)
        case 1:
            target = secondList.remove(at: sourceIndexPath.row)
        default:
            break
        }
        
        guard let item = target else { return }
        
        switch destinationIndexPath.section {
        case 0:
            firstList.insert(item, at: destinationIndexPath.row)
        case 1:
            secondList.insert(item, at: destinationIndexPath.row)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    } // 왼쪽의 여백 제거
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if proposedDestinationIndexPath.section == 0 {
            return sourceIndexPath
        } // 두번째 파라미터를 리턴하면 원래 위치로 돌아감
        
        return proposedDestinationIndexPath
    } // 셀을 첫번째 섹션으로 이동할수 없도록 제한하는 메소드, 이 메소드는 셀을 드래그한다음 원하는 위치에서 드롭할때 호출됨
    // 셀의 최종 위치는 세번째 파라미터의 인덱스페스의 위치에 따라서 결정됨
    
}

extension ReorderingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}


