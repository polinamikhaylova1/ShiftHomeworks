import UIKit

protocol CarBrandsViewProtocol: AnyObject {
    func showCarBrands(_ cars: [Car])
    func navigateToCarDetails(with car: Car)
}

class CarBrandsViewController: UIViewController {
    var presenter: CarBrandsPresenterProtocol!
    var tableView: UITableView!
    var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.loadCarBrands()
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
        let carDetailsVC = CarDetailsViewController()
        let carDetailsModel = CarDetailsModel()
        let carDetailsPresenter = CarDetailsPresenter(view: carDetailsVC, model: carDetailsModel, car: car)
        carDetailsVC.presenter = carDetailsPresenter
        navigationController?.pushViewController(carDetailsVC, animated: true)
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
