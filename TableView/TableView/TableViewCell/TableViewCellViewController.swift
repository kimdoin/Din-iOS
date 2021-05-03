import UIKit

class TableViewCellViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    let list = ["Hero1", "Hero2", "Hero3", "Hero4", "Hero5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            if let indexPath = listTableView.indexPath(for: cell) {
                if let vc = segue.destination as? DetailViewController {
                    vc.value = list[indexPath.row]
                    vc.image = UIImage(named: "\(list[indexPath.row])")
                }
            }
        }
    }
}

extension TableViewCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let img = UIImage(named: "\(list[indexPath.row])")
        cell.textLabel?.text = list[indexPath.row]
        cell.imageView?.image = img
        return cell
    }
}

extension TableViewCellViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
