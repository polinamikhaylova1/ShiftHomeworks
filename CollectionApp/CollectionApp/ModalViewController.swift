import UIKit

class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        constraintView()
        
    }
    let closeButton: UIButton = {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitleColor(.black, for: .normal)
        return closeButton
    }()
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Хороших выходных!"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    func constraintView() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    @objc func closeModal() {
        dismiss(animated: true, completion: nil)
    }
}
