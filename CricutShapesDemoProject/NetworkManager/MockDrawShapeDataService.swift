//
//  MockDrawShapeDataService.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/22/25.
//

import Foundation

final class MockDrawShapeDataService: DrawShapeDataService {
    override func fetchShapeData() async throws -> ButtonListResponse {
        return ButtonListResponse(buttons: [
            ButtonConfig(name: "Circle", drawPath: .circle),
            ButtonConfig(name: "Square", drawPath: .square)
        ])
    }
}
