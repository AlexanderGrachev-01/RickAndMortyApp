//
//  RMRequest.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 25.12.2022.
//

import Foundation

final class RMRequest {
    
    // MARK: - Private
    
    private struct Constants {
        static let baseURl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    
    private let pathComponents: [String]
    
    private let queryParamets: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseURl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach {
                string += "/\($0)"
            }
        }
        
        if !queryParamets.isEmpty {
            string += "?"
            let argumentString = queryParamets.compactMap {
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }.joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    // MARK: - Public
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(endpoint: RMEndpoint,
                pathComponents: [String] = [],
                queryParamets: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParamets = queryParamets
    }
    
    convenience init?(url: URL) {
        let urlString = url.absoluteString
        if !urlString.contains(Constants.baseURl) {
            return nil
        }
        let trimmed = urlString.replacingOccurrences(of: Constants.baseURl + "/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0]
                if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                    self.init(endpoint: rmEndpoint)
                    return
                }
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemsString = components[1]
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap {
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    return URLQueryItem(name: parts[0], value: parts[1])
                }
                if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                    self.init(endpoint: rmEndpoint, queryParamets: queryItems)
                    return
                }
            }
        }
        
        return nil
    }
}

extension RMRequest {
    static let listCharactersRequest = RMRequest(endpoint: .character)
}
