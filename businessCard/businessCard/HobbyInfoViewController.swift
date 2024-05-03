import UIKit

class HobbyInfoViewController: UIViewController {
    
    private lazy var hobbyInfoView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, photoLabel,photoText,sportLabel,sportText])
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
    struct LabelStyle {
        static let font = UIFont.systemFont(ofSize: 14)
        static let numberOfLines = 0
    }
    
    let titleLabel = TextSettings.makeTitle(withText: "О моих хобби")
    
    let photoLabel = TextSettings.makeLabel(withText: "Фотография")
    
    let photoText = TextSettings.makeLabelHobbyDescripption(withText: "Я занимаюсь фотографией около 6 лет.\nНа данный момоент работаю руководителем фотомастерской в СУНЦ НГУ, в школе, которую сама закончила.\nМой профиль - портретная фотосъемка, но я так же очень люблю фотографировать в путешествиях")
    
    let sportLabel = TextSettings.makeLabel(withText: "Спорт")
    
    let sportText = TextSettings.makeLabelHobbyDescripption(withText: "Занимаюсь спортом всю свою жизнь: в детстве это была хореографическая школа, сейчас я хожу в тренажерный зал 2-3 раза в неделю. Спорт разбавляет мой сидячий образ жизни и наполняет меня энергией.")
    
    private func setuphobbyInfoViewConstrains() {
        hobbyInfoView.layoutMargins = .init(top: 5, left: 0, bottom:5, right:0)
        NSLayoutConstraint.activate([
            hobbyInfoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hobbyInfoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hobbyInfoView.heightAnchor.constraint(equalTo: hobbyInfoView.widthAnchor),
            hobbyInfoView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor)
            
        ])
    }
    
    private func titleViewCostrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            ])
    }
}
