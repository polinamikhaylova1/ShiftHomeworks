import UIKit

final class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var items: [ItemViewModel] = []

    init(navigationController: UINavigationController?) {
        let itemList = Source.allItems()
        self.items = itemList.map { ItemViewModel(from: $0) }
        super.init()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as? ItemCell else {
            fatalError("невозможно создать ячейку с идентификатором \(ItemCell.identifier)")
        }
        let viewModel = items[indexPath.item]
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 180
        let height: CGFloat = 180
        return CGSize(width: width, height: height)
    }
    func getItem(at indexPath: IndexPath) -> ItemViewModel {
        return items[indexPath.item]
    }
        
    func getItems() -> [ItemViewModel] {
        return items
    }
}
