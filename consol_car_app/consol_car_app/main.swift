import Foundation



class CarManager {
    var cars: [Car] = []
    
    func addCar() {
        print(inputStrings.inputManufacture.rawValue)
        let manufacture = readLine() ?? ""
        
        print(inputStrings.inputModel.rawValue)
        let model = readLine() ?? ""
        
        print(infoStrings.bodyTypeAvailable.rawValue)
        print(BodyType.coupe.rawValue, BodyType.sedan.rawValue, BodyType.hatchback.rawValue, BodyType.suv.rawValue,BodyType.coupe.rawValue, BodyType.convertible.rawValue)
        print(inputStrings.inputBodyType.rawValue)
        
        var body: BodyType?
        repeat {
            if let userInput = readLine(), let selectedBodyType = BodyType(rawValue: userInput) {
                body = selectedBodyType
            }
            else {
                print(errorStrings.errorInputBodyType.rawValue)
            }
        } while body == nil
        
        guard let selectedBody = body else { return }
        
        print(inputStrings.inputYearOfIssue.rawValue)
        
        guard let yearOfIssue = readLine(), let yearOfIssue = Int(yearOfIssue) else {return}
        
        print(inputStrings.inputcarNumber.rawValue)
        let carNumber = readLine() ?? ""
        
        
        let car = Car(manufacture: manufacture, model: model, body: selectedBody, yearOfIssue:yearOfIssue,carNumber:carNumber )
        cars.append(car)
        print(infoStrings.carAdded.rawValue)
    }
    
    func listAllCars() {
        if cars.isEmpty {
            print(errorStrings.listEmpty.rawValue)
        } else {
            print(infoStrings.listOfCars.rawValue)
            for car in cars {
                print("\(car.manufacture) \(car.model) \(car.body) \(car.yearOfIssue)\(car.carNumber)")
            }
        }
    }
    
    func listCarsByBodyType() {
        print(infoStrings.bodyTypeAvailable.rawValue)
        print(inputStrings.inputBodyType.rawValue)
        
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
            print(errorStrings.filteredCarsEmpty.rawValue)
        } else {
            print(infoStrings.listFilteredCars.rawValue,(selectedBody.rawValue))
            for car in filteredCars {
                print("\(car.manufacture) \(car.model)")
            }
        }
    }
    
    
    func run() {
        var shouldQuit = false
        while !shouldQuit {
            print(MenuOption.selectAction.rawValue)
            print(MenuOption.addCar.rawValue)
            print(MenuOption.printlistAllCars.rawValue)
            print(MenuOption.printlistCarsByBodyType.rawValue)
            print(MenuOption.exit.rawValue)
            
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
                    print(errorStrings.error.rawValue)
                    }
                } else {
                    print(errorStrings.error.rawValue)
                }
            }
        }
}
let carManager = CarManager()
carManager.run()
