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
