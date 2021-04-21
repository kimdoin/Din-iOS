import UIKit

class SwitchTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // 셀 초기화 코드
        let v = UISwitch(frame: .zero)
        accessoryView = v
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
