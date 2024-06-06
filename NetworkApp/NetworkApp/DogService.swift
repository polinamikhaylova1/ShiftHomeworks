import Moya
import UIKit

struct DogImageResponse: Decodable {
    let message: [String]
    let status: String
}

class DogService {
    let provider = MoyaProvider<DogAPI>()
    var downloadTasks: [URL: URLSessionDownloadTask] = [:]
    var progressHandlers: [URL: (Float) -> Void] = [:]
    var resumeDataDict: [URL: Data] = [:]
    
    func fetchImages(for breed: String, progress: @escaping (Float) -> Void, completion: @escaping (Result<[UIImage], Error>) -> Void) {
        provider.request(.getBreedImages(breed: breed)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                do {
                    let imageResponse = try JSONDecoder().decode(DogImageResponse.self, from: response.data)
                    loadImages(from: imageResponse.message, progress: progress, completion: completion)
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func loadImages(from urls: [String], progress: @escaping (Float) -> Void, completion: @escaping (Result<[UIImage], Error>) -> Void) {
        let dispatchGroup = DispatchGroup()
        var loadedImages: [UIImage] = []
        let totalImages = urls.count
        var completedImages = 0
        
        guard totalImages > 0 else {completion(.success([]))
            return }
        
        for url in urls {
            dispatchGroup.enter()
            guard let imageURL = URL(string: url) else { continue }
            
            let downloadTask = URLSession.shared.downloadTask(with: imageURL) { (location, response, error) in
                defer { dispatchGroup.leave() }
                if let location = location, let data = try? Data(contentsOf: location), let image = UIImage(data: data) {
                    loadedImages.append(image)
                    completedImages += 1
                }
                
                let currentProgress = Float(completedImages) / Float(totalImages)
                DispatchQueue.main.async {
                    progress(currentProgress)
                }
            }
            downloadTasks[imageURL] = downloadTask
            progressHandlers[imageURL] = progress
            downloadTask.resume()
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(.success(loadedImages))
        }
    }
    
    func pauseDownload(for url: URL) {
        downloadTasks[url]?.cancel(byProducingResumeData: { [weak self] resumeData in
                guard let self = self else { return }
                if let resumeData = resumeData {
                    self.resumeDataDict[url] = resumeData
                   }
                self.downloadTasks.removeValue(forKey: url)
            })
    }
    
    func resumeDownload(for url: URL) {
        downloadTasks[url]?.resume()
    }
}
