import Foundation

protocol CarDetailsPresenterProtocol {
    func didLoadCarDetails(view:CarDetailsViewProtocol )
    func bodyTypeDidChange(to bodyType: String)
    func calculatePriceButtonTapped()
    //func showCarDetails(_ car: Car)
}

class CarDetailsPresenter: CarDetailsPresenterProtocol {
    
    private weak var view: CarDetailsViewProtocol?
    private var model: CarDetailsModelProtocol
    private var currentBodyType: String?
    private var car: Car
    private var bodyTypes: [String] = []
    
    init(view: CarDetailsViewProtocol?, model: CarDetailsModelProtocol, car: Car) {
        self.model = model
        self.car = car
        self.bodyTypes = Array(car.images.keys)
    }
    
    func didLoadCarDetails(view:CarDetailsViewProtocol ) {
        self.view = view
        currentBodyType = car.images.keys.first
        view.hideLoading()
        view.showCarDetails(car)
        if let defaultBodyType = currentBodyType, let price = car.prices[defaultBodyType] {
            view.updatePrice(price)
            view.updateImage(car.images[defaultBodyType]!)
        }
    }
    
    func bodyTypeDidChange(to bodyType: String) {
        currentBodyType = bodyType
        if let imageUrl = car.images[bodyType] {
            view?.showLoading()
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) { [weak self] in
                DispatchQueue.main.async {
                    self?.view?.updateImage(imageUrl)
                    self?.view?.hideLoading()
                }
            }
        }
    }

    
    func calculatePriceButtonTapped() {
        guard let currentBodyType = currentBodyType, let price = car.prices[currentBodyType] else { return }
        
        view?.showLoading()
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) { [weak self] in
            DispatchQueue.main.async {
                self?.view?.updatePrice(price)
                self?.view?.hideLoading()
            }
        }
    }
}
