import Foundation

struct Car {
    let name: String
    let images: [String: String]
    let prices: [String: Double]
}

protocol CarDetailsModelProtocol {
    func fetchCarDetails(for brand: String, completion: @escaping (Car?) -> Void)
}

class CarDetailsModel: CarDetailsModelProtocol {
    func fetchCarDetails(for carBrand: String, completion: @escaping (Car?) -> Void) {
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
                let car = CarDataStore.getCar(for: carBrand)
                completion(car)
            }
    }
    
}

