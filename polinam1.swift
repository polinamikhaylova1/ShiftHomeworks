import Foundation

enum BodyType: String, CaseIterable{
    case sedan = "Седан"
    case hatchback = "Хэтчбек"
    case suv = "Внедорожник"
    case coupe = "Купе"
    case convertible = "Кабриолет"
}

struct Car {
    var manufacture: String
    var model: String
    var body: BodyType
    var yearOfIssue: Int
    
    init(manufacture: String, model: String, body: BodyType, yearOfIssue:Int) {
        self.manufacture = manufacture
        self.model = model
        self.body = body
        self.yearOfIssue = yearOfIssue
    }
}

// Класс, управляющий приложением
class CarManager {
    var cars: [Car] = []
    
    // Функция добавления нового автомобиля
    func addCar() {
        print("Введите марку автомобиля:")
        let manufacture = readLine() ?? ""
        
        print("Введите модель автомобиля:")
        let model = readLine() ?? ""
        
        print("Введите тип кузова автомобиля:")
        
        var body: BodyType?
        repeat {
            if let userInput = readLine(), let selectedBodyType = BodyType(rawValue: userInput) {
                body = selectedBodyType
            }
        } while body == nil
        
        guard let selectedBody = body else { return }
        
        print("Введите год выпуска автомобиля:")
        
        guard let yearOfIssue = readLine(), let yearOfIssue = Int(yearOfIssue) else {return}
        
        
        let car = Car(manufacture: manufacture, model: model, body: selectedBody, yearOfIssue:yearOfIssue )
        cars.append(car)
        print("Автомобиль успешно добавлен!")
    }
    
    // Функция вывода списка всех автомобилей
    func listAllCars() {
        if cars.isEmpty {
            print("Список автомобилей пуст")
        } else {
            print("Список всех автомобилей:")
            for car in cars {
                print("\(car.manufacture) \(car.model) \(car.body) \(car.yearOfIssue)")
            }
        }
    }
    
    // Функция вывода списка автомобилей с использованием фильтра по типу кузова
    func listCarsByBodyType() {
        print("Введите тип кузова для фильтрации:")
        print("Доступные типы кузова:")
        for bodyType in BodyType.allCases {
            print("\(bodyType.rawValue)")
        }
        
        var filterBodyType: BodyType?
        repeat {
            if let userInput = readLine(), let selectedBodyType = BodyType(rawValue: userInput) {
                filterBodyType = selectedBodyType
            }
        } while filterBodyType == nil
        
        guard let selectedBody = filterBodyType else { return }
        
        let filteredCars = cars.filter { $0.body == selectedBody }
        
        if filteredCars.isEmpty {
            print("Нет автомобилей с указанным типом кузова")
        } else {
            print("Список автомобилей с типом кузова '\(selectedBody.rawValue)':")
            for car in filteredCars {
                print("\(car.manufacture) \(car.model)")
            }
        }
    }
    
    
    func run() {
        var shouldQuit = false
        while !shouldQuit {
            print("\nВыберите действие:")
            print("1. Добавить новый автомобиль")
            print("2. Вывести список всех автомобилей")
            print("3. Вывести список автомобилей по типу кузова")
            print("4. Выйти")
            
            if let choice = readLine(), let option = Int(choice) {
                switch option {
                case 1:
                    addCar()
                case 2:
                    listAllCars()
                case 3:
                    listCarsByBodyType()
                case 4:
                    shouldQuit = true
                default:
                    print("Некорректный ввод. Пожалуйста, выберите число от 1 до 4")
                    }
                } else {
                    print("Некорректный ввод. Пожалуйста, выберите число от 1 до 4")
                }
            }
        }
}
let carManager = CarManager()
carManager.run()

