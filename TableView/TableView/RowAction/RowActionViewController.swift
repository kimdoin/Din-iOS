
import UIKit
import MessageUI

class RowActionViewController: UIViewController {
    
    
    var list = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @IBOutlet weak var listTableView: UITableView!
    
    func sendEmail(with data: String) {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setSubject("Test Mail")
        composer.setMessageBody(data, isHTML: false)
        
        present(composer, animated: true, completion: nil)
    }
    
    
    func sendMessage(with data: String) {
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        
        let composer = MFMessageComposeViewController()
        composer.messageComposeDelegate = self
        composer.body = data
        
        present(composer, animated: true, completion: nil)
    }
    
    
    func delete(at indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        listTableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}


extension RowActionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension RowActionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let emailAction = UITableViewRowAction(style: .default, title: "Email") { [weak self] action, indexPath in
            if let data = self?.list[indexPath.row] {
                self?.sendEmail(with: data)
            }
        }
        emailAction.backgroundColor = UIColor.black
        
        let messageAction = UITableViewRowAction(style: .normal, title: "SMS") { [weak self] action, indexPath in
            if let data = self?.list[indexPath.row] {
                self?.sendMessage(with: data)
            }
        }
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] action, indexPath in
            self?.delete(at: indexPath)
        }
        
        return [deleteAction, messageAction, emailAction]
    }// 셀을 왼쪽으로 스와이프하면 이 메소드가 호출됨, 여기에서 기본 삭제 버튼을 대체함
}

extension RowActionViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}


extension RowActionViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
