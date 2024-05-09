import UIKit

class DetailViewController: UIViewController {
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let item = item {
            title = item.labelText
            
            let descriptionLabel = UILabel()
            descriptionLabel.text = item.descriptionText
            descriptionLabel.numberOfLines = 0
            
            descriptionLabel.lineBreakMode = .byWordWrapping
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(descriptionLabel)
                    
            NSLayoutConstraint.activate([
                descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
                ])
        }
        view.addSubview(button)
        constraintView()
        
    }
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Нажми, пикник есть в планах на твои майские", for: .normal)
        button.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    func constraintView() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -40)
        ])
    }
    
    @objc func showModal() {
        let modalViewController = ModalViewController()
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
    }
}
