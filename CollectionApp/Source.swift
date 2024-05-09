
struct Source {
    static func allPhotos() -> [Photo] { [
        .init(id: 1, imageName: "шашлык", descriptionText: "тут будет текст описание"),
        .init(id: 2, imageName: "дрова",descriptionText: "тут будет текст описание222"),
        .init(id: 3, imageName: "овощи", descriptionText: "описание овощей")
    ]
    }
    
    static func allPhotosInOrder() -> [Photo] {
        return allPhotos().sorted { $0.id < $1.id }
    }
}

struct Photo {
    let id: Int
    let imageName : String
    let descriptionText: String
}

