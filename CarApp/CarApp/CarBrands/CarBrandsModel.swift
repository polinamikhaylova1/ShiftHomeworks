import Foundation

struct CarBrand {
    let name: String
}

protocol CarBrandsModelProtocol {
    func fetchAllCars(completion: @escaping ([Car]) -> Void)
}

class CarBrandsModel: CarBrandsModelProtocol {
    func fetchAllCars(completion: @escaping ([Car]) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            let cars = CarDataStore.getAllCars()
            completion(cars)
        }
    }
}

