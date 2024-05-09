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
            descriptionLabel.numberOfLines = 0 // Разрешаем перенос строк
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(descriptionLabel)
                    
            NSLayoutConstraint.activate([
                    descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
                ])
        }
        
        let button = UIButton(type: .system)
        button.setTitle("Show Modal", for: .normal)
        button.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func showModal() {
        let modalViewController = ModalViewController()
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
    }
}
