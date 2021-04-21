import UIKit

class MultiSectionTableViewController: UIViewController {

    let list = PhotosSettingSection.generateData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension MultiSectionTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = list[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
        
        switch target.type {
        case .disclosure:
            cell.textLabel?.text = target.title
            cell.imageView?.image = UIImage(systemName: target.imageName ?? "")
        case .switch:
            cell.textLabel?.text = target.title
            if let switchView = cell.accessoryView as? UISwitch {
                switchView.isOn = target.on
            }
        case .action:
            cell.textLabel?.text = target.title
        case .checkmark:
            cell.textLabel?.text = target.title
            cell.accessoryType = target.on ? .checkmark : .none
        }
        return cell
    }
    
   
    // 헤더 표시 메소드
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].header
    }
    
    // 풋터 표시 메소드
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return list[section].footer
    }
}
