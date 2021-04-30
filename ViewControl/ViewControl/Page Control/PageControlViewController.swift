import UIKit

class PageControlViewController: UIViewController {

    var imgList = ["one", "two", "three", "four", "five"]
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var pager: UIPageControl!
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension PageControlViewController: UIScrollViewDelegate {
    
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
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
        

        return collectionView.bounds.size
    }
}

class ListCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
}
