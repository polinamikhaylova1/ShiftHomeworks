import UIKit

protocol CarBrandsViewProtocol: AnyObject {
    func showCarBrands(_ cars: [Car])
    func navigateToCarDetails(with car: Car)
}

class CarBrandsViewController: UIViewController {
    private var presenter: CarBrandsPresenterProtocol
    private var chooseLabel = UILabel()
    private var chooseBrandLabel = UILabel()
    private var tableView = UITableView()
    private var cars: [Car] = []
    
    init(presenter: CarBrandsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.loadCarBrands(view: self)
    }
    
    
}

extension CarBrandsViewController: CarBrandsViewProtocol {
    func showCarBrands(_ cars: [Car]) {
        self.cars = cars
        tableView.reloadData()
    }
    
    func navigateToCarDetails(with car: Car) {
        let carDetailsVC = createCarDetailsViewController(with: car)
        navigationController?.pushViewController(carDetailsVC, animated: true)
        navigationController?.navigationBar.tintColor = UIColor(red: 0.0/255.0, green: 158.0/255.0, blue: 105.0/255.0, alpha: 1.0)
    }

    private func createCarDetailsViewController(with car: Car) -> CarDetailsViewController {
        let carDetailsModel = CarDetailsModel()
        let presenter = CarDetailsPresenter(view: nil, model: carDetailsModel, car: car)
        let carDetailsVC = CarDetailsViewController(presenter: presenter)
        
        
        return carDetailsVC
    }
}

extension CarBrandsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrandCell", for: indexPath)
        cell.textLabel?.text = cars[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCar(at: indexPath.row)
    }
}
private extension CarBrandsViewController {
    func setupUI() {
        view.backgroundColor = .white
        chooseLabel = UILabel()
        chooseLabel.text = "Выберите"
        chooseLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        view.addSubview(chooseLabel)
        
        chooseBrandLabel = UILabel()
        chooseBrandLabel.text = "Марку машины"
        chooseBrandLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseBrandLabel.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(chooseBrandLabel)
        
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BrandCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            chooseLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chooseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
            chooseBrandLabel.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: 30),
            chooseBrandLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: chooseBrandLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
}



