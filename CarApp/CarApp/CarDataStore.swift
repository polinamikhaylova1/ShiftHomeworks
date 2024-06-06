import Foundation

struct CarDataStore {
    static let cars: [Car] = [
        Car(name: "Toyota", 
            images: ["Седан": "седанТ.jpg", "Кроссовер": "кроссоверТ.jpg", "Хэтчбек": "хэтчбекТ.jpg", "Купе": "купеТ.jpg"],
            prices: ["Седан": 20000, "Кроссовер": 25000, "Хэтчбек": 18000, "Купе": 27000]),
        Car(name: "Hyuindai",
            images: ["Седан": "седанХ.jpg", "Кроссовер": "кроссоверХ.jpg", "Хэтчбек": "хэтчбекХ.jpg", "Купе": "купеХ.jpg"],
            prices: ["Седан": 21000, "Кроссовер": 26000, "Хэтчбек": 19000, "Купе": 28000]),
        Car(name: "Peugeot", images: ["Седан": "седанП.jpg", "Кроссовер": "кроссоверП.jpg", "Хэтчбек": "хэтчбекП.jpg", "Купе": "купеП.jpg"],
            prices: ["Седан": 35000, "Кроссовер": 40000, "Хэтчбек": 33000, "Купе": 45000]),
        Car(name: "Ford",
            images: ["Седан": "седанФ.jpg", "Кроссовер": "кроссоверф.jpg", "Хэтчбек": "хэтчбекФ.jpg", "Купе": "купеФ.jpg"],
            prices: ["Седан": 36000, "Кроссовер": 42000, "Хэтчбек": 34000, "Купе": 46000]),
        Car(name: "Audi",
            images: ["Седан": "седанА.jpg", "Кроссовер": "кроссоверА.jpg", "Хэтчбек": "хэтчбекА.jpg", "Купе": "купеА.jpg"],
            prices: ["Седан": 37000, "Кроссовер": 43000, "Хэтчбек": 35000, "Купе": 47000])
    ]
    
    static func getAllCars() -> [Car] {
        return cars
    }
    static func getCar(for brand: String) -> Car? {
            return cars.first { $0.name == brand }
        }
        
    static func getAllBrands() -> [String] {
            return cars.map { $0.name }
        }
}


