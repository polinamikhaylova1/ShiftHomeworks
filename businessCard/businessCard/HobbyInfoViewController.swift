import UIKit

class HobbyInfoViewController: UIViewController {
    
    private lazy var hobbyInfoView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, photoLabel,photo1Label,sportLabel,sport1Label,backButton,])
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
        view.addSubview(hobbyInfoView)
        view.addSubview(titleLabel)
        titleViewCostrains()
        setuphobbyInfoViewConstrains()
        view.backgroundColor = .orange
    }
    
    private let titleLabel: UILabel =  {
        let label = UILabel(frame: .zero)
        label.text =  "О моих хобби"
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let photoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Фотография"
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let photo1Label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Я занимаюсь фотографией около 6 лет.\nНа данный момоент работаю руководителем фотомастерской в СУНЦ НГУ, в школе, которую сама закончила.\nМой профиль - портретная фотосъемка, но я так же очень люблю фотографировать в путешествиях"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let sportLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Спорт"
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let sport1Label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Занимаюсь спортом всю свою жизнь: в детстве это была хореографическая школа, сейчас я хожу в тренажерный зал 2-3 раза в неделю. Спорт разбавляет мой сидячий образ жизни и наполняет меня энергией."
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setuphobbyInfoViewConstrains() {
        hobbyInfoView.layoutMargins = .init(top: 5, left: 0, bottom:5, right:0)
        NSLayoutConstraint.activate([
            hobbyInfoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hobbyInfoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hobbyInfoView.heightAnchor.constraint(equalTo: hobbyInfoView.widthAnchor),
            hobbyInfoView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor)
            
        ])
    }
    private let backButton: UIButton = {
        let button = UIButton (type: .system)
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private func titleViewCostrains() {
        NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -310) // Регулируйте значение, чтобы установить отступ сверху
    
            ])
    }
    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
