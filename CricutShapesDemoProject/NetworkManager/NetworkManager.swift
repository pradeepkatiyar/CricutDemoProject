//
//  NetworkManager.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/21/25.
//

import Foundation

protocol NetworkService {
    func request<T: Decodable>(with request: URLRequest) async throws -> T
}

public enum NetworkError: Error {
    case invalidURL
    case badData
    case invalidStatusCode(Int)
    case decodeError(Error)
    case other(Error)
}

// Network manager for the API call
final class NetworkManager: NetworkService {
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request<T: Decodable>(with request: URLRequest) async throws -> T {
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.badData
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidStatusCode(httpResponse.statusCode)
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                return decoded
            } catch {
                throw NetworkError.decodeError(error)
            }
        } catch {
            throw NetworkError.other(error)
        }
    }
}
