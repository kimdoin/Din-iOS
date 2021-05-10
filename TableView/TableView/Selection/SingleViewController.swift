import UIKit

class SingleViewController: UIViewController {

    
    @IBOutlet weak var listTableView: UITableView!
    
    func selectRandomCell() {
        let row = Int.random(in: 0 ..< 100)
        let target = IndexPath(row: row, section: 0)
        
        listTableView.selectRow(at: target, animated: true, scrollPosition: .top)
    }
    
    func deselect() {
        if let selected = listTableView.indexPathForSelectedRow {
            listTableView.deselectRow(at: selected, animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                let first = IndexPath(row: 0, section: 0)
                self?.listTableView.scrollToRow(at: first, at: .top, animated: true)
            }
        }
    }
    
    @objc func showMenu(_ sender: UIBarButtonItem) {
        let menu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let selectRandomCellAction = UIAlertAction(title: "랜덤 선택", style: .default) { action in
            self.selectRandomCell()
        }
        menu.addAction(selectRandomCellAction)
        
        let deselectAction = UIAlertAction(title: "선택 해제", style: .default) { action in
            self.deselect()
        }
        menu.addAction(deselectAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        menu.addAction(cancelAction)
        
        if let pc = menu.popoverPresentationController {
            pc.barButtonItem = sender
        }
        
        present(menu, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu(_:)))
    }
}

extension SingleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
}

extension SingleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            return nil
        }
        return indexPath
    } // 셀 선택 전에 호출
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let target = "\(indexPath.row)"
        
        showAlert(with: target)
        
        // 셀 선택했을때 TextColor 변경
        tableView.cellForRow(at: indexPath)?.textLabel?.textColor = .red
    } // 셀 선택 직후에 실행
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        tableView.cellForRow(at: indexPath)?.textLabel?.textColor = .black
        return indexPath
    } // 선택된 셀이 해제되기 직전에 호출
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
    } // 선택된 셀이 해제된 후에 호출
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row != 0
    } // 셀을 강조하기 전에 호출 , true -> 강조, false -> 강조x
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.textLabel?.textAlignment = .center
    } // 셀이 강조된 다음에 호출
    
//    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.textLabel?.textColor = .systemOrange
//    } // 강조효과가 제거된 다음에 호출
}


extension SingleViewController {
    func showAlert(with value: String) {
        let alert = UIAlertController(title: nil, message: value, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
