import UIKit

final class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    weak var navigationController: UINavigationController?
    private var items: [Item] = []

    init(navigationController: UINavigationController?) {
        self.items = Source.allItems()
        super.init()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as? ItemCell else {
            fatalError("невозможно создать ячейку с идентификатором \(ItemCell.identifier)")
        }
        let item = items[indexPath.item]
        cell.imageView.image = UIImage(named: item.imageName)
        cell.labelCaption.text = item.labelText
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 180
        let height: CGFloat = 180
        return CGSize(width: width, height: height)
    }
}
