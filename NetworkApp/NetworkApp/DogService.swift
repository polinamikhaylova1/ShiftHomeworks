import Moya
import UIKit

struct DogImageResponse: Decodable {
    let message: [String]
    let status: String
}

class DogService {
    let provider = MoyaProvider<DogAPI>()
    
    func fetchImages(for breed: String,progress: @escaping (Float) -> Void, completion: @escaping (Result<[UIImage], Error>) -> Void) {
            provider.request(.getBreedImages(breed: breed)) { result in
                switch result {
                case .success(let response):
                    do {
                        let imageResponse = try JSONDecoder().decode(DogImageResponse.self, from: response.data)
                        self.loadImages(from: imageResponse.message,progress: progress, completion: completion)
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    func loadImages(from urls: [String], progress: @escaping (Float) -> Void, completion: @escaping (Result<[UIImage], Error>) -> Void) {
        let dispatchGroup = DispatchGroup()
        var loadedImages: [UIImage] = []
        let totalImages = urls.count
        var completedImages = 0
            
        for url in urls {
            dispatchGroup.enter()
            guard let imageURL = URL(string: url) else { continue }
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                defer { dispatchGroup.leave() }
                if let data = data, let image = UIImage(data: data) {
                    loadedImages.append(image)
                }
                completedImages += 1
                    let currentProgress = Float(completedImages) / Float(totalImages)
                        DispatchQueue.main.async {
                            progress(currentProgress)
                }
            }.resume()
        }
            
            dispatchGroup.notify(queue: .main) {
                completion(.success(loadedImages))
            }
        }
}

