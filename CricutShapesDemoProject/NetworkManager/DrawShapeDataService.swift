//
//  DrawShapeDataService.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/21/25.
//

import Foundation

protocol DrawShapeService {
    func fetchShapeData() async throws -> ButtonListResponse
}

class DrawShapeDataService: DrawShapeService {
    
    private let networkService: NetworkService

    init(service: NetworkService = NetworkManager()) {
        self.networkService = service
    }

    func fetchShapeData() async throws -> ButtonListResponse {
        let url = URL(string: "https://staticcontent.cricut.com/static/test/shapes_001.json")!
        let request = URLRequest(url: url)
        return try await networkService.request(with: request)
    }
}
