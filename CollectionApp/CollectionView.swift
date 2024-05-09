import UIKit

final class CollectionView: UIView {
    
    lazy var headerView: UIView = {
            let headerView = UIView()
            headerView.translatesAutoresizingMaskIntoConstraints = false
        
                let label = UILabel()
                label.text = "Стартерпак на майские"
                label.textColor = .black
                label.font = UIFont.boldSystemFont(ofSize: 20)
                label.translatesAutoresizingMaskIntoConstraints = false
                headerView.addSubview(label)
                
                NSLayoutConstraint.activate([
                    label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                    label.centerYAnchor.constraint(equalTo: headerView.bottomAnchor, constant:-25)
                ])
                
                return headerView
        }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.isUserInteractionEnabled = true
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.identifier)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setDataSource(_ dataSource: CollectionViewDataSource) {
        collectionView.dataSource = dataSource
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 120, height: 120)
        return layout
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(collectionView)
        addSubview(headerView)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
