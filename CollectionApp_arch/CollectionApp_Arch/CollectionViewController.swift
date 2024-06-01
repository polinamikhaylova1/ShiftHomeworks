import UIKit


final class CollectionViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    private let dataSource = CollectionViewDataSource(navigationController: nil)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let item = dataSource.getItem(at: indexPath)
        let detailViewController = createDetailViewController(for: item)
        navigateToDetailViewController(detailViewController)
    }
    
    private func createDetailViewController(for item: ItemViewModel) -> DetailViewController {
        let presenter = DetailPresenter(view: nil, item: item)
        let detailViewController = DetailViewController(presenter: presenter)
        return detailViewController
    }
        
    private func navigateToDetailViewController(_ viewController: DetailViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}



