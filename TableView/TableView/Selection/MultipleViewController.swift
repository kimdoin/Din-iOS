import UIKit

class MultipleViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    
    @objc func report() {
        if let indexPathList = listTableView.indexPathsForSelectedRows {
            let selected = indexPathList.map {_ in
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Report", style: .plain, target: self, action: #selector(report))
    }
}


extension MultipleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

class MultipleCell: UITableViewCell {
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        
        accessoryType = selected ? .checkmark : .none
    }
}
