
import UIKit

final class ModalView: UIView {
    let closeButton: UIButton = {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitleColor(.black, for: .normal)
        return closeButton
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
  
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
}
private extension ModalView {
   func setupView() {
        backgroundColor = .yellow
        
        addSubview(titleLabel)
        addSubview(closeButton)
        
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
        closeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        closeButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}




