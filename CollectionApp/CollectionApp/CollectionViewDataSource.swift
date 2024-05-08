import UIKit

final class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let items: [Item] 
    
    weak var navigationController: UINavigationController?
        
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        let photos = Source.allPhotosInOrder()
        self.items = photos.map { photo in
            Item(imageName: photo.imageName, labelText: photo.imageName)
        }
        super.init()
        }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        let item = items[indexPath.item]
        cell.imageView.image = UIImage(named: item.imageName)
        cell.label.text = item.labelText
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let detailViewController = DetailViewController()
            detailViewController.item = items[indexPath.item]
            navigationController?.pushViewController(detailViewController, animated: true)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 180
        let height: CGFloat = 180
        return CGSize(width: width, height: height)
    }
}
