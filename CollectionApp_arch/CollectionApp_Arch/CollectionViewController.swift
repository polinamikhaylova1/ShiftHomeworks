import UIKit


final class CollectionViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    private let dataSource = CollectionViewDataSource(navigationController: nil)
    private var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = Source.allItems()
    }
    override func loadView() {
        view = contentView
    }
    private lazy var contentView: CollectionView = {
        let view = CollectionView()
        view.setDataSource(dataSource)
        view.collectionView.delegate = self
        view.collectionView.dragInteractionEnabled = true
        view.backgroundColor = .white
        return view
    }()
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView?.register(ItemCell.self, forCellWithReuseIdentifier: "ItemCell")
        collectionView?.backgroundColor = .white
        collectionView?.dataSource = dataSource
        collectionView?.delegate = self
    }

}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let item = items[indexPath.item]
            let detailViewController = DetailViewController()
            let presenter = DetailPresenterImpl(view: detailViewController, item: item)
            detailViewController.presenter = presenter
            navigationController?.pushViewController(detailViewController, animated: true)
        }
}



