//
//  ButtonListResponse.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/21/25.
//

import Foundation

struct ButtonListResponse: Decodable {
    let buttons: [ButtonConfig]
}

struct ButtonConfig: Decodable, Equatable {
    let name: String
    let drawPath: ShapeType

    enum CodingKeys: String, CodingKey {
        case name
        case drawPath = "draw_path"
    }
    
    enum ShapeType: String, Decodable {
        case circle = "circle"
        case square = "square"
        case triangle = "triangle"
    }
}

struct ShapeItem: Identifiable {
    let id = UUID()
    let type: ButtonConfig.ShapeType
}

