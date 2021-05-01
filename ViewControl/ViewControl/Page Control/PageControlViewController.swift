import UIKit

class PageControlViewController: UIViewController {

    var imgList = ["one", "two", "three", "four", "five"]
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var pager: UIPageControl!
    @IBAction func pageChanged(_ sender: UIPageControl) {
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        listCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 초기화 구현
        pager.numberOfPages = imgList.count
        // 현재 페이지
        pager.currentPage = 0
        
        // 컬러 속성 변경
       // pager.pageIndicatorTintColor = UIColor.systemGray3
       // pager.currentPageIndicatorTintColor = UIColor.systemRed
    }
    
}

extension PageControlViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) { // 컬렉션뷰를 스크롤하면 반복적으로 호출
        let width = scrollView.bounds.size.width
        let x = scrollView.contentOffset.x + (width / 2.0) // 현재스크롤한 x좌표 저장, 좌표보정을 위해서 절반의 넓이를 더해줌
        
        let newPage = Int(x / width)
        if pager.currentPage != newPage {
            pager.currentPage = newPage
        }
    }
}

extension PageControlViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ListCell else {
            return UICollectionViewCell()
        }
        let img = UIImage(named: "\(imgList[indexPath.item]).png")
        cell.imgView.image = img
        
        return cell
    }
}

extension PageControlViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
        return collectionView.bounds.size
    }
}

class ListCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
}

// UIScrollView Delegate 채용, 페이지 컨트롤을 스크롤할때마다 현재페이지를 계산해서 커런트페이지에 저장

// 페이지컨트롤을 탭할때 해당 컨트롤로 이동하는 방법은 벨류체인지드 이벤트를 이용해서 구현
