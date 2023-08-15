

import Foundation


final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    @discardableResult
    func download(url:URL, completion: @escaping(Result<Data,Error>) -> ()) -> URLSessionDataTask {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                return }
            completion(.success(data))
        }
       
        dataTask.resume()
        return dataTask
    }
}
