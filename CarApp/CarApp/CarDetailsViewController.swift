import UIKit

protocol CarDetailsViewProtocol: AnyObject {
    
    func showLoading()
    func hideLoading()
    func showCarDetails(_ car: Car)
    func updatePrice(_ price: Double)
    func updateImage(_ imageUrl: String)
}

class CarDetailsViewController: UIViewController, CarDetailsViewProtocol {
    
    private var carImageView = UIImageView()
    private var bodyTypeLabel = UILabel()
    private var bodyTypeTableView = UITableView()
    private var priceLabel = UILabel()
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    private var calculatePriceButton = UIButton(type: .system)
    
    private var presenter: CarDetailsPresenterProtocol
    private var car: Car?
    
    private var bodyTypes: [String] = []
    
    init(presenter: CarDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.didLoadCarDetails(view: self)
    }
    

    @objc func calculatePriceButtonTapped() {
        presenter.calculatePriceButtonTapped()
    }
    
    func showLoading() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
 
    func showCarDetails(_ car: Car) {
        bodyTypes = Array(car.images.keys)
        bodyTypeTableView.reloadData()
    }
    
    func updatePrice(_ price: Double) {
        priceLabel.text = "Цена:\(price) $"
    }
    
    func updateImage(_ imageUrl: String) {
        carImageView.image = UIImage(named: imageUrl)
    }
}

extension CarDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bodyTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BodyTypeCell", for: indexPath)
        cell.textLabel?.text = bodyTypes[indexPath.row] 
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBodyType = bodyTypes[indexPath.row]
        presenter.bodyTypeDidChange(to: selectedBodyType)
        
    }
}

private extension CarDetailsViewController {
   
    
    func setupUI() {
        view.backgroundColor = .white
        
        carImageView = UIImageView()
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carImageView)
        
        bodyTypeLabel = UILabel()
        bodyTypeLabel.text = "Выберите тип кузова"
        bodyTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyTypeLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        view.addSubview(bodyTypeLabel)
        
        bodyTypeTableView = UITableView()
        bodyTypeTableView.translatesAutoresizingMaskIntoConstraints = false
        bodyTypeTableView.dataSource = self
        bodyTypeTableView.delegate = self
        bodyTypeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "BodyTypeCell")
        view.addSubview(bodyTypeTableView)
        
        priceLabel = UILabel()
        priceLabel.text = "Цена"
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.addSubview(priceLabel)
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        
        calculatePriceButton = UIButton(type: .system)
        calculatePriceButton.setTitle("Рассчитать цену", for: .normal)
        calculatePriceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        calculatePriceButton.setTitleColor(.white, for: .normal)
        calculatePriceButton.translatesAutoresizingMaskIntoConstraints = false
        calculatePriceButton.addTarget(self, action: #selector(calculatePriceButtonTapped), for: .touchUpInside)
        calculatePriceButton.backgroundColor = UIColor(red: 0.0/255.0, green: 158.0/255.0, blue: 105.0/255.0, alpha: 1.0)
        calculatePriceButton.layer.cornerRadius = 10
        view.addSubview(calculatePriceButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            carImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carImageView.widthAnchor.constraint(equalToConstant: 300),
            carImageView.heightAnchor.constraint(equalToConstant: 225),
            
            priceLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 20),
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bodyTypeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            bodyTypeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bodyTypeTableView.topAnchor.constraint(equalTo: bodyTypeLabel.bottomAnchor, constant: 10),
            bodyTypeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bodyTypeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bodyTypeTableView.heightAnchor.constraint(equalToConstant: 200),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            calculatePriceButton.topAnchor.constraint(equalTo: bodyTypeTableView.bottomAnchor, constant: 40),
            calculatePriceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculatePriceButton.widthAnchor.constraint(equalToConstant: 300),
            calculatePriceButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
