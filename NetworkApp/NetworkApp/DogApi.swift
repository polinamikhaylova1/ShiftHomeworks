import Moya
import Foundation

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
