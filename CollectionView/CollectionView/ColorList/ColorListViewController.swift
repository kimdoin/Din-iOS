
import UIKit

class ColorListViewController: UIViewController {

    let list = MaterialColorDataSource.generateMultiSectionData()
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let layout = listCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 200, height: 200) // Cell 크기
            layout.minimumInteritemSpacing = 5 // Cell 여백
            layout.minimumLineSpacing = 5 // Line 여백
            
            layout.sectionInset = UIEdgeInsets(top: 5, left: 4, bottom: 5, right: 4) // section 여백
        }
    }
    

}

/*
 Cell height 계산 -> 실제 높이에서 셀 높이를 뺀 값을 계산
 */

extension ColorListViewController: UICollectionViewDelegateFlowLayout {
    
}

extension ColorListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list[section].colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.contentView.backgroundColor = list[indexPath.section].colors[indexPath.row]
        return cell
    }
}

/*
 Collection View는 Flow Layout을 통해서 View를 배치
 Scroll방향에 따라서 Cell을 배치
 Cell 크기는 itemSize로 설정, 50포인트가 기본값
 여백 최솟값 minimumLineSpacing, Interitem Spacing, 10포인트로 설정되어있음
 setionInset -> 셀 여백, 0 포인트가 기본값
 */
