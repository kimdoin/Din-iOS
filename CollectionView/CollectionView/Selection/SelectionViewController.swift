import UIKit

class SelectionViewController: UIViewController {
    
    lazy var list: [MaterialColorDataSource.Color] = {
        (0...2).map { _ in
            return MaterialColorDataSource.generateSingleSectionData() }.reduce([], +)
    }()
    
    lazy var checkImage: UIImage? = UIImage.init(named: "checked")
    
    func slectRandomItem() {
        
        
    }
    
    func reset() {
        
    }
    
    @objc func showMenu() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let randomAction = UIAlertAction(title: "랜덤 선택", style: .default) { [weak self] (action) in
            self?.slectRandomItem()
        }
        actionSheet.addAction(randomAction)
        
        let restAction = UIAlertAction(title: "초기화", style: .default) { [weak self] (action) in
            self?.reset()
        }
        actionSheet.addAction(restAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu))
        // Do any additional setup after loading the view.
    }
    
    
}

extension SelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = list[indexPath.row].color
        return cell
    }
}

extension SelectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color = list[indexPath.item].color
        view.backgroundColor = color
        if let cell = collectionView.cellForItem(at: indexPath) {
            if let imageView = cell.contentView.viewWithTag(100) as? UIImageView {
                imageView.image = checkImage
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print("1:셀 선택 직전", indexPath, #function)
        guard let list = collectionView.indexPathsForSelectedItems else { return true }
        
        return !list.contains(indexPath)
    } // 셀을 선택하기 직전에 호출 , 여기에서 true를 리턴하면 실제로 선택되고, false를 리턴하면 선택x
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        return true
    }  //셀을 선택해제하기 전에 호출됨, true를 리턴하면 실제로 해제, false를 리턴하면 선택상태 유지
    // 선택을 해제하기 전에 어떤 액션을 해야한다면 false를 리턴하고 경고창을 표시하는 형태로 구현할 수 있음
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("2:셀 해제", indexPath, #function)
        if let cell = collectionView.cellForItem(at: indexPath) {
            if let imageView = cell.contentView.viewWithTag(100) as? UIImageView {
                imageView.image = nil
            }
        }
    } // 선택이 해제된 후에 호출됨, 선택이 해제된 후 유아이업데이트를 할 때 사용할 수 있음
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        print("3:셀 강조", indexPath, #function)
        return true
    } // 셀을 강조하기 전에 호출됨, true 강조, false 강조 x
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("4:셀 강조 후", indexPath, #function)
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        print("5:셀 강조 끝", indexPath, #function)
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 0
        }
    }
    
}

