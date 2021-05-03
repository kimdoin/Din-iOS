
import UIKit

class CustomCellViewController: UIViewController {

    
    @IBOutlet weak var listTableView: UITableView!
    
    let list = WorldTime.generateData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension CustomCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TimeTableViewCell else {
            return UITableViewCell()
        }
        
        let target = list[indexPath.row]
        cell.dateLabel.text = "\(target.date), \(target.hoursFromGMT)HRS"
        cell.locationLabel.text = target.location
        cell.timeLabel.text = target.time
        
        return cell
    }
}



class TimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
}
