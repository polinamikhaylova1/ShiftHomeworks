import UIKit

class DevInfoViewController: UIViewController {
    
    private lazy var devInfoView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, schoolLabel,interestedMobileDevLabel, firstProjectLabel,shiftLabel,futureLabel])
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
        view.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.7, alpha: 1.0)
    }
    
    let titleLabel = TextSettings.makeTitle(withText: "О моих навыках разработки")

    let schoolLabel = TextSettings.makeLabel(withText: "Программирование в школе\n(C, C++)\nПрограммирование в университете\n(Python, C, C++)")
    
    let interestedMobileDevLabel = TextSettings.makeLabel(withText: "Интерес к мобильной разработке")

    let firstProjectLabel = TextSettings.makeLabel(withText: "Первый проект 'калькулятор'")

    let shiftLabel = TextSettings.makeLabel(withText: "ШИФТ")
    
    let futureLabel = TextSettings.makeLabel(withText: "Дальше - больше!")
    
    
    
    private func setupdevInfoViewConstrains() {
        devInfoView.layoutMargins = .init(top: 8, left: 0, bottom:8, right:0)
        NSLayoutConstraint.activate([
            devInfoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            devInfoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            devInfoView.heightAnchor.constraint(equalTo: devInfoView.widthAnchor),
            devInfoView.widthAnchor.constraint(equalTo: devInfoView.widthAnchor),
            
        ])
    }
    
    private func titleViewCostrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            ])
    }
        
    

}

