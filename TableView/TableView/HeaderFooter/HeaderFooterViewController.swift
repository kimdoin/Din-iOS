import UIKit

class HeaderFooterViewController: UIViewController {

    
    let list = ["A","AA", "AAA", "ABA", "BA", "BB", "AC", "AD", "FF", "BBC", "AP", "QE", "QEA", "QBFA", "ASDWW", "QWDQDQWDA", "AADADAW", "ASDWQQR", "ASDASDNN", "AACSVV", "ASDQWWQD"]
    let filterList = ["A","AA", "AAA", "ABA", "BA", "BB", "AC", "AD", "FF", "BBC", "AP", "QE", "QEA", "QBFA", "ASDWW", "QWDQDQWDA", "AADADAW", "ASDWQQR", "ASDASDNN", "AACSVV", "ASDQWWQD"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(<#T##@objc method#>), name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
    }
}

extension HeaderFooterViewController: UISearchBarDelegate {
    
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
