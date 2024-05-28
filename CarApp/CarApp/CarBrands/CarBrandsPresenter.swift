import Foundation

protocol CarBrandsPresenterProtocol {
    func loadCarBrands()
    func didSelectCar(at index: Int)
}

class CarBrandsPresenter: CarBrandsPresenterProtocol {
    
    private weak var view: CarBrandsViewProtocol?
    var model: CarBrandsModelProtocol
    var cars: [Car] = []
    
    init(view: CarBrandsViewProtocol, model: CarBrandsModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func loadCarBrands() {
        cars = CarDataStore.getAllCars()
        view?.showCarBrands(cars)
    }
        
    func didSelectCar(at index: Int) {
        let car = cars[index]
        view?.navigateToCarDetails(with: car)
    }
}


