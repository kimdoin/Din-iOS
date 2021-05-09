import UIKit

class HeaderFooterViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    let list = ["A","AA", "AAA", "ABA", "BA", "BB", "AC", "AD", "FF", "BBC", "AP", "QE", "QEA", "QBFA", "ASDWW", "QWDQDQWDA", "AADADAW", "ASDWQQR", "ASDASDNN", "AACSVV", "ASDQWWQD"]
    var filterList = ["A","AA", "AAA", "ABA", "BA", "BB", "AC", "AD", "FF", "BBC", "AP", "QE", "QEA", "QBFA", "ASDWW", "QWDQDQWDA", "AADADAW", "ASDWQQR", "ASDASDNN", "AACSVV", "ASDQWWQD"]
    
    
    lazy var resultLabel: UILabel = { [weak self] in
        var frame = self?.view.bounds ?? .zero
        frame.size.height = 70
        
        let lbl = UILabel(frame: frame)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.white
        lbl.backgroundColor = UIColor.gray
        
        return lbl
    }()
    
    @objc func handle(notification: Notification) {
        switch notification.name {
        case UIResponder.keyboardWillShowNotification:
            if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                var inset = listTableView.contentInset
                inset.bottom = frame.height
                listTableView.contentInset = inset
            }
        case UIResponder.keyboardWillHideNotification:
            var inset = listTableView.contentInset
            inset.bottom = 0
            listTableView.contentInset = inset
        default:
            break
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handle(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handle(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension HeaderFooterViewController: UISearchBarDelegate {
    func filter(with keyword: String) {
        if keyword.count > 0 {
            filterList = list.filter { $0.contains(keyword)}
        } else {
            filterList = list
        }
        
        listTableView.reloadData()
        resultLabel.text = "\(filterList.count) 결과를 찾았습니다."
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter(with: searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        listTableView.tableFooterView = resultLabel
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.text = nil
        resultLabel.text = "0개의 검색 결과"
        listTableView.tableFooterView = nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filter(with: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filterList = list
        listTableView.reloadData()
        
        searchBar.resignFirstResponder()
    }
    
    
}


extension HeaderFooterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let target = filterList[indexPath.row]
        cell.textLabel?.text = target
        return cell
    }
}
