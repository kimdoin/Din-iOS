import UIKit

class SectionHeaderFooterViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    let list = Region.generateData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
    }
}

extension SectionHeaderFooterViewController: UITableViewDataSource {
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

extension SectionHeaderFooterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: "header")
        
        headerView?.textLabel?.text = list[section].title
        
        
        headerView?.backgroundColor = .secondarySystemFill
        headerView?.textLabel?.textColor = .systemBlue
        headerView?.textLabel?.textAlignment = .center
        
        return headerView
    }
}
