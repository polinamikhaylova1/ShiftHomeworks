import UIKit

protocol CarDetailsViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showCarDetails(_ car: Car)
    func updatePrice(_ price: Double)
    func updateImage(_ imageUrl: String)
    
}

class CarDetailsViewController: UIViewController, CarDetailsViewProtocol {
    
    var carImageView: UIImageView!
    var bodyTypeLabel: UILabel!
    var bodyTypeTableView: UITableView!
    var priceLabel: UILabel!
    var activityIndicator: UIActivityIndicatorView!
    var calculatePriceButton: UIButton!
    
    var presenter: CarDetailsPresenterProtocol!
    var car: Car?
    
    var bodyTypes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.loadCarDetails()
    }
    
    
    
    func setupUI() {
        view.backgroundColor = .white
        
        carImageView = UIImageView()
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carImageView)
        
        bodyTypeLabel = UILabel()
        bodyTypeLabel.text = "Выберите кузов"
        bodyTypeLabel.translatesAutoresizingMaskIntoConstraints = false
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
        view.addSubview(priceLabel)
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        
        calculatePriceButton = UIButton(type: .system)
        calculatePriceButton.setTitle("Calculate Price", for: .normal)
        calculatePriceButton.translatesAutoresizingMaskIntoConstraints = false
        calculatePriceButton.addTarget(self, action: #selector(calculatePriceButtonTapped), for: .touchUpInside)
        view.addSubview(calculatePriceButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            carImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carImageView.widthAnchor.constraint(equalToConstant: 200),
            carImageView.heightAnchor.constraint(equalToConstant: 200),
            
            bodyTypeLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 20),
            bodyTypeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bodyTypeTableView.topAnchor.constraint(equalTo: bodyTypeLabel.bottomAnchor, constant: 10),
            bodyTypeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bodyTypeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bodyTypeTableView.heightAnchor.constraint(equalToConstant: 150),
            
            priceLabel.topAnchor.constraint(equalTo: bodyTypeTableView.bottomAnchor, constant: 20),
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            calculatePriceButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            calculatePriceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func calculatePriceButtonTapped() {
        presenter.calculatePrice()
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
        self.car = car
        self.bodyTypes = Array(car.images.keys)
        bodyTypeTableView.reloadData()
        
        if let defaultBodyType = bodyTypes.first {
            updateImage(car.images[defaultBodyType]!)
            presenter.bodyTypeDidChange(to: defaultBodyType)
            if let price = car.prices[defaultBodyType] {
                updatePrice(price)
            }
        }
    }
    
    func updatePrice(_ price: Double) {
        priceLabel.text = "Цена: \(price) $"
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
