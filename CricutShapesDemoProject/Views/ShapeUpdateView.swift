//
//  ShapeUpdateView.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/21/25.
//

import SwiftUI

struct ShapeUpdateView: View {
    @ObservedObject private var viewModel: ShapesViewModel
    private let currentShapeType: ButtonConfig.ShapeType = .circle
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(viewModel: ShapesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.listOfShapes) { item in
                        if item.type == currentShapeType {
                            CircularView()
                        }
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Button("Delete All") {
                    viewModel.removeShapesByType(shapeItemType: currentShapeType)
                }
                Spacer()
                Button("Add") {
                    viewModel.addNewShapeInListByType(shapeType: currentShapeType)
                }
                Spacer()
                Button("Remove") {
                    if let itemId = viewModel.listOfShapes.last(where: { $0.type == currentShapeType })?.id {
                        viewModel.removeShapesById(shapeItemId: itemId)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ShapeUpdateView(viewModel: ShapesViewModel())
}
