//
//  RMService.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 25.12.2022.
//

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    complition: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            complition(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                complition(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            do {
//                let json = try JSONSerialization.jsonObject(with: data)
//                print(String(describing: json))
                let result = try JSONDecoder().decode(type.self, from: data)
                complition(.success(result))
            }
            catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
