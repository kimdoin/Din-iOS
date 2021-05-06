import UIKit

class SectionHeaderFooterViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    let list = Region.generateData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        listTableView.sectionIndexColor = UIColor.black
        listTableView.sectionIndexBackgroundColor = UIColor.gray
        listTableView.sectionIndexTrackingBackgroundColor = UIColor.red
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
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return list.map { $0.title }
    }
    // 이 메소드는 섹션 인덱스 타이틀을 드래그한 다음에 실제로 타이틀로 이동하기 전에 호출.
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index 
    }
    // 섹션 헤더 추가
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return list[section].title
    //    }
}

extension SectionHeaderFooterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        
        headerView?.textLabel?.text = list[section].title
        
        
//        headerView?.backgroundColor = .secondarySystemFill
        headerView?.textLabel?.textColor = .systemBlue
        headerView?.textLabel?.textAlignment = .center
        
//        if headerView?.backgroundColor == nil {
//            let v = UIView(frame: .zero)
//            v.backgroundColor = .secondarySystemFill
//            v.isUserInteractionEnabled = false
//            headerView?.backgroundView = v
//        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .systemBlue
            headerView.textLabel?.textAlignment = .center
            
//            if headerView.backgroundView == nil {
//                let v = UIView(frame: .zero)
//                v.backgroundColor = .secondarySystemFill
//                v.isUserInteractionEnabled = false
//                headerView.backgroundView = v
//            }
        }
    }
}

// 커스텀 헤더 구현
// 1. UITableViewHeaderFooterView를 사용
// 2. 첫번째 방법을 서브클래싱하고 UI를 직접 구성하는 방법
