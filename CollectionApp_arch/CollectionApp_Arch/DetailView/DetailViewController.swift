import UIKit

class DetailViewController: UIViewController, DetailView {
    
    var presenter: DetailPresenter?

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Нажми, если пикник есть в планах на твои майские", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(descriptionLabel)
        view.addSubview(button)
        setupConstraints()
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        presenter?.viewDidLoad()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func setDescription(_ description: String) {
        descriptionLabel.text = description
    }
    
    @objc private func buttonTapped() {
        showModal()
    }
    
    func showModal() {
        let message = Message(text: "Хороших выходных!")
        let viewModel = ModalViewModel(message: message)
        let modalViewController = ModalViewController()
        modalViewController.configure(with: viewModel)
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
    }
}

