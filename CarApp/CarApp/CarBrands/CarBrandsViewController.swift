import UIKit

protocol CarBrandsViewProtocol: AnyObject {
    func showCarBrands(_ cars: [Car])
    func navigateToCarDetails(with car: Car)
}

class CarBrandsViewController: UIViewController {
    private var presenter: CarBrandsPresenterProtocol
    private var tableView: UITableView
    private var cars: [Car] = []

    init(presenter: CarBrandsPresenterProtocol) {
        self.presenter = presenter
        self.tableView = UITableView()
        super.init(nibName: nil, bundle: nil)
        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.loadCarBrands(view: self)
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BrandCell")
        view.addSubview(tableView)
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
