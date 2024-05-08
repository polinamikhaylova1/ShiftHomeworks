
struct Source {
    static func allPhotos() -> [Photo] { [
        .init(id: 1, imageName : "шашлык"),
        .init(id: 2, imageName : "дрова")]
    }
    static func allPhotosInOrder() -> [Photo] {
        return allPhotos().sorted { $0.id < $1.id }
    }
    
}
struct Photo {
    let id: Int
    let imageName : String
}

