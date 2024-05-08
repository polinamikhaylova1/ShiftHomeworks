import UIKit

class ItemCell: UICollectionViewCell {
    
    static let identifier = String(describing: ItemCell.self)
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        self.clipsToBounds = true
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor), // Высота изображения равна ширине (чтобы был квадрат)
                   
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8), // Расстояние между изображением и текстом
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                    
            ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
