//
//  ShapesViewModelTests.swift
//  CricutShapesDemoProjectTests
//
//  Created by Pradeep Katiyar on 8/22/25.
//

import XCTest
@testable import CricutShapesDemoProject

@MainActor
final class ShapesViewModelTests: XCTestCase {

    var viewModel: ShapesViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ShapesViewModel(dataService: MockDrawShapeDataService())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchShapesAndButtonsLoadsCorrectData() async {
        await viewModel.fetchShapesAndButtons()
        XCTAssertEqual(viewModel.buttons.count, 2)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.buttons[0].name, "Circle")
        XCTAssertEqual(viewModel.buttons[1].drawPath, .square)
    }

    func testAddNewShapeAppendsToList() {
        viewModel.addNewShapeInListByType(shapeType: .triangle)
        XCTAssertEqual(viewModel.listOfShapes.count, 1)
        XCTAssertEqual(viewModel.listOfShapes.first?.type, .triangle)
    }

    func testRemoveShapesByTypeRemovesCorrectItems() {
        viewModel.addNewShapeInListByType(shapeType: .circle)
        viewModel.addNewShapeInListByType(shapeType: .circle)
        viewModel.addNewShapeInListByType(shapeType: .square)
        
        viewModel.removeShapesByType(shapeItemType: .circle)
        
        XCTAssertEqual(viewModel.listOfShapes.count, 1)
        XCTAssertEqual(viewModel.listOfShapes.first?.type, .square)
    }

    func testRemoveShapeByIdRemovesCorrectItem() {
        viewModel.addNewShapeInListByType(shapeType: .circle)
        viewModel.addNewShapeInListByType(shapeType: .triangle)
        
        let idToRemove = viewModel.listOfShapes[0].id
        viewModel.removeShapesById(shapeItemId: idToRemove)
        
        XCTAssertEqual(viewModel.listOfShapes.count, 1)
        XCTAssertNotEqual(viewModel.listOfShapes.first?.id, idToRemove)
    }

    func testRemoveAllShapesEmptiesList() {
        viewModel.addNewShapeInListByType(shapeType: .circle)
        viewModel.addNewShapeInListByType(shapeType: .triangle)
        viewModel.removeAllShapes()
        
        XCTAssertTrue(viewModel.listOfShapes.isEmpty)
    }
}
