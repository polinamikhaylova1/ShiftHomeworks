import UIKit

class DevInfoViewController: UIViewController {
    
    private lazy var devInfoView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, schoolLabel,interestedMobileDevLabel, firstProjectLabel,shiftLabel,futureLabel,backButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        stackView.layer.cornerRadius = 16
        stackView.layer.masksToBounds = true
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(devInfoView)
        view.addSubview(titleLabel)
        titleViewCostrains()
        setupdevInfoViewConstrains()
        view.backgroundColor = UIColor.lightGreen
    }
    
    private let titleLabel: UILabel =  {
        let label = UILabel(frame: .zero)
        label.text =  "О моих навыках разработки"
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let schoolLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Программирование в школе\n(C, C++)\nПрограммирование в университете\n(Python, C, C++)"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 8
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let interestedMobileDevLabel: UILabel = {
           let label = UILabel(frame: .zero)
           label.text = "Интерес к мобильной разработке"
           label.font = .boldSystemFont(ofSize: 20)
           label.numberOfLines = 0
           label.textAlignment = .center
           label.layer.borderColor = UIColor.black.cgColor
           label.layer.borderWidth = 1.0
           label.layer.cornerRadius = 8
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
    }()
    
    private let firstProjectLabel: UILabel = {
           let label = UILabel(frame: .zero)
           label.text = "Первый проект 'калькулятор'"
           label.font = .boldSystemFont(ofSize: 20)
           label.numberOfLines = 0
           label.textAlignment = .center
           label.layer.borderColor = UIColor.black.cgColor
           label.layer.borderWidth = 0.5
           label.layer.cornerRadius = 12
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
    }()
    
    private let shiftLabel: UILabel = {
           let label = UILabel(frame: .zero)
           label.text = "ШИФТ"
           label.font = .boldSystemFont(ofSize: 20)
           label.numberOfLines = 0
           label.textAlignment = .center
           label.layer.borderColor = UIColor.black.cgColor
           label.layer.borderWidth = 1.0
           label.layer.cornerRadius = 8
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
    }()
    private let futureLabel: UILabel = {
           let label = UILabel(frame: .zero)
           label.text = "Дальше - больше!"
           label.font = .boldSystemFont(ofSize: 20)
           label.numberOfLines = 0
           label.textAlignment = .center
           label.layer.borderColor = UIColor.black.cgColor
           label.layer.borderWidth = 1.0
           label.layer.cornerRadius = 8
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
    }()

    private let backButton: UIButton = {
        let button = UIButton (type: .system)
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor.darkGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private func setupdevInfoViewConstrains() {
        devInfoView.layoutMargins = .init(top: 8, left: 0, bottom:8, right:0)
        NSLayoutConstraint.activate([
            devInfoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            devInfoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            devInfoView.heightAnchor.constraint(equalTo: devInfoView.widthAnchor),
            devInfoView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor)
            
        ])
    }
    
    private func titleViewCostrains() {
        NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -310) 
    
            ])
    }
        
    
    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    

}


extension UIColor {
    static let lightGreen = UIColor(red: 0.7, green: 0.9, blue: 0.7, alpha: 1.0)
    static let darkGreen = UIColor(red: 0.1, green: 0.5, blue: 0.1, alpha: 1.0)
}
