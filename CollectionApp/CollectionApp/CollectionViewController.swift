import UIKit


final class CollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture))
        contentView.collectionView.addGestureRecognizer(longPressGesture)
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
        view.backgroundColor = .systemGray
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
    @objc private func longPressGesture(_ gesture: UILongPressGestureRecognizer) {
        switch(gesture.state) {
        case .began:
            guard let selectedIndexPath = contentView.collectionView.indexPathForItem(at: gesture.location(in: contentView.collectionView)) else {
                break
            }
            contentView.collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            contentView.collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
            contentView.collectionView.endInteractiveMovement()
        default:
            contentView.collectionView.cancelInteractiveMovement()
        }
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}



