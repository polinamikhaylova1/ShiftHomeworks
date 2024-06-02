import Foundation
import Moya
import UIKit

struct DogImageResponse: Decodable {
    let message: [String]
    let status: String
}

enum DogAPI {
    case getBreedImages(breed: String)
}

extension DogAPI: TargetType {
    var baseURL: URL { return URL(string: "https://dog.ceo/api/")! }
    
    var path: String {
        switch self {
        case .getBreedImages(let breed):
            return "breed/\(breed)/images"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

class DogService {
    let provider = MoyaProvider<DogAPI>()
    
    func fetchImages(for breed: String, completion: @escaping (Result<[UIImage], Error>) -> Void) {
            provider.request(.getBreedImages(breed: breed)) { result in
                switch result {
                case .success(let response):
                    do {
                        let imageResponse = try JSONDecoder().decode(DogImageResponse.self, from: response.data)
                        self.loadImages(from: imageResponse.message, completion: completion)
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    func loadImages(from urls: [String], completion: @escaping (Result<[UIImage], Error>) -> Void) {
            let dispatchGroup = DispatchGroup()
            var loadedImages: [UIImage] = []
            
            for url in urls {
                dispatchGroup.enter()
                guard let imageURL = URL(string: url) else { continue }
                URLSession.shared.dataTask(with: imageURL) { data, response, error in
                    defer { dispatchGroup.leave() }
                    if let data = data, let image = UIImage(data: data) {
                        loadedImages.append(image)
                    }
                }.resume()
            }
            
            dispatchGroup.notify(queue: .main) {
                completion(.success(loadedImages))
            }
        }
}

