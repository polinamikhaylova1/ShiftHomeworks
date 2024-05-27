import UIKit

class ItemCell: UICollectionViewCell {
    
    static let identifier = String(describing: ItemCell.self)
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func configure(with viewModel: ItemViewModel) {
        imageView.image = UIImage(named: viewModel.imageName)
        labelCaption.text = viewModel.labelText
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelCaption: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    func setupUI() {
        layer.masksToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(labelCaption)
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.black.cgColor
        self.clipsToBounds = true
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            labelCaption.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelCaption.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelCaption.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
    }
    
}
