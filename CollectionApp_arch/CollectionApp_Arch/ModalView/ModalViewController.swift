import UIKit

class ModalViewController: UIViewController {
    
    private var viewModel: ModalViewModel?

    private let closeButton: UIButton = {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitleColor(.black, for: .normal)
        return closeButton
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
            
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        
        setupConstraints()
        configureView()
        }
        
    func configure(with viewModel: ModalViewModel) {
        self.viewModel = viewModel
        self.viewModel?.messageDidChange = { [weak self] message in
            self?.titleLabel.text = message.text
        }
    }
        
    private func configureView() {
        if let viewModel = viewModel {
            titleLabel.text = viewModel.message.text
        }
    }
    
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                closeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
    
    @objc func closeModal() {
        dismiss(animated: true, completion: nil)
    }
}


