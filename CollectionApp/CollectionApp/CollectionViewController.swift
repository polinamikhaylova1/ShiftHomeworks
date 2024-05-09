import UIKit


final class CollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = dataSource.items

    }
    
    override func loadView() {
        view = contentView
    }
    
    let dataSource = CollectionViewDataSource(navigationController: nil)

    
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
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "ItemCell")
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = dataSource
        collectionView.delegate = self
                
        view.addSubview(collectionView)
    }

}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.item = items[indexPath.item]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}



