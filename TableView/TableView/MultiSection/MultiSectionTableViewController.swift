import UIKit

class MultiSectionTableViewController: UIViewController {

    let list = PhotosSettingSection.generateData()
    @IBOutlet weak var listTableView: UITableView!
    
    @objc func toggleHideAlbum(_ sender: UISwitch) {
        print(#function)
        list[1].items[0].on.toggle()
    }
    
    @objc func toggleAutoPlayVideos(_ sender: UISwitch) {
        print(#function)
        list[2].items[0].on.toggle()
    }
    
    @objc func toggleSummarizePhots(_ sender: UISwitch) {
        print(#function)
        list[2].items[1].on.toggle()
    }
    
    @objc func toggleShowHolidayEvents(_ sender: UISwitch) {
        print(#function)
        list[3].items[1].on.toggle()
    }
    
    func showActionSheet() {
        let sheet = UIAlertController(title: nil, message: "Resetting will allow previously blocked people, places, dates, or holidays to once again be included in new Memories.", preferredStyle: .actionSheet)
        
        let resetAction = UIAlertAction(title: "Reset", style: .destructive, handler: nil)
        sheet.addAction(resetAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        sheet.addAction(cancelAction)
        
        if let pc = sheet.popoverPresentationController {
            if let tbl = view.subviews.first(where: { $0 is UITableView }) as? UITableView {
                if let cell = tbl.cellForRow(at: IndexPath(row: 0, section: 3)) {
                    pc.sourceView = cell
                    pc.sourceRect = tbl.frame
                }
            }
        }
        
        present(sheet, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // 신이 표시되기 직전에 표시
        
        if let selected = listTableView.indexPathForSelectedRow { // 셀 클릭 초기화
            listTableView.deselectRow(at: selected, animated: true)
        }
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
            if let switchView = cell.accessoryView as? UISwitch { // 옵셔널, 타입캐스팅 필요
                switchView.isOn = target.on
                
                switchView.removeTarget(nil, action: nil, for: .valueChanged)
                if indexPath.section == 1 && indexPath.row == 0 {
                    switchView.addTarget(self, action: #selector(toggleHideAlbum(_:)), for: .valueChanged)
                } else if indexPath.section == 2 && indexPath.row == 0 {
                    switchView.addTarget(self, action: #selector(toggleAutoPlayVideos(_:)), for: .valueChanged)
                } else if indexPath.section == 2 && indexPath.row == 1 {
                    switchView.addTarget(self, action: #selector(toggleSummarizePhots(_:)), for: .valueChanged)
                } else {
                    switchView.addTarget(self, action: #selector(toggleShowHolidayEvents(_:)), for: .valueChanged)
                }
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

extension MultiSectionTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 && indexPath.row == 0 {
            showActionSheet()
            
            tableView.deselectRow(at: indexPath, animated: true) // 선택상태 제거
        }
        
        if indexPath.section == 4 {
            if let cell = tableView.cellForRow(at: indexPath) { // 선택한 셀 요청
                list[indexPath.section].items[indexPath.row].on.toggle()
                cell.accessoryType = list[indexPath.section].items[indexPath.row].on ? .checkmark : .none
                
//                switch indexPath.row {
//                case 0:
//                    tableView.allowsMultipleSelection = true
//                case 1:
//                    tableView.deselectRow(at: indexPath, animated: true)
//                default:
//                    break
//                }
            }
        }
    }
}
