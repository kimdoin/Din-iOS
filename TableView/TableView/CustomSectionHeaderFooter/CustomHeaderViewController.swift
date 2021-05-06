
import UIKit

class CustomHeaderViewController: UIViewController {

    
    let list = Region.generateData()
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let headerNib = UINib(nibName: "CustomHeader", bundle: nil)
        listTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "header")
    }


}


extension CustomHeaderViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let target = list[indexPath.section].countries[indexPath.row]
        
        cell.textLabel?.text = target
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return list[section].title
//    }
    
    
}

extension CustomHeaderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CustomHeader else {
//            return UITableViewHeaderFooterView()
//        }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! CustomHeader
        
        headerView.titleLabel.text = list[section].title
        headerView.countLabel.text = "\(list[section].countries.count)"
        
        return headerView
    }
}
