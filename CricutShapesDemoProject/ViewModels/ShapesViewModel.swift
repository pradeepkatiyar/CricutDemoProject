//
//  ShapesViewModel.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/21/25.
//

import Foundation

@MainActor
final class ShapesViewModel: ObservableObject {
    @Published var buttons: [ButtonConfig] = []
    @Published var errorMessage: String?
    @Published var listOfShapes: [ShapeItem] = []
    
    private let dataService: DrawShapeDataService

    init(dataService: DrawShapeDataService = DrawShapeDataService()) {
        self.dataService = dataService
    }

    // API call
    func fetchShapesAndButtons() async {
        do {
            let response = try await dataService.fetchShapeData()
            buttons = response.buttons
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    // Add New Shape in the list
    func addNewShapeInListByType(shapeType: ButtonConfig.ShapeType) {
        let newShapeItem = ShapeItem(type: shapeType)
        listOfShapes.append(newShapeItem)
    }
    
    // Remove Shape from list 
    func removeShapesByType(shapeItemType: ButtonConfig.ShapeType) {
        listOfShapes.removeAll { $0.type == shapeItemType }
    }
    
    func removeShapesById(shapeItemId: UUID) {
        listOfShapes.removeAll { $0.id == shapeItemId }
    }
    
    func removeAllShapes() {
        listOfShapes.removeAll()
    }
}
