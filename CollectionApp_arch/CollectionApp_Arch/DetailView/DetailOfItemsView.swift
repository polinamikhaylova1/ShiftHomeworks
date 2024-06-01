import UIKit

final class DetailOfItemsView: UIView {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Нажми, если пикник есть в планах на твои майские", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    
}
private extension DetailOfItemsView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
        descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
        button.centerXAnchor.constraint(equalTo: centerXAnchor),
        button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    func setupView() {
        backgroundColor = .white
        addSubview(descriptionLabel)
        addSubview(button)
        setupConstraints()
    }
}
