//
//  Strings.swift
//  consol_car_app
//
//  Created by Полина Михайлова on 16.04.2024.
//

import Foundation

enum MenuOption: String {
    case selectAction = "\n Выберите действие:"
    case addCar = "1.Добавить новый автомобиль"
    case printlistAllCars = "2.Вывести список всех автомобилей"
    case printlistCarsByBodyType = "3.Вывести список автомобилей по типу кузова"
    case exit = "4. Выйти"
}

enum inputStrings: String {
    case inputManufacture = "Введите марку автомобиля:"
    case inputModel = "Введите модель автомобиля:"
    case inputBodyType = "Введите тип кузова автомобиля:"
    case inputYearOfIssue = "Введите год выпуска автомобиля:"
    case inputcarNumber = "Введите Гос.номер:"
}

enum infoStrings: String {
    case carAdded = "Автомобиль успешно добавлен!"
    case listFilteredCars = "Список автомобилей с типом кузова"
    case listOfCars = "Список всех автомобилей:"
    case bodyTypeAvailable = "Доступные типы кузова:"
}

enum errorStrings: String {
    case errorInputBodyType = "Некорректный ввод. Пожалуйста, выберите один из доступных типов кузова."
    case error = "Некорректный ввод. Пожалуйста, выберите число от 1 до 4"
    case listEmpty = "Список автомобилей пуст"
    case filteredCarsEmpty = "Нет автомобилей с указанным типом кузова"
}
