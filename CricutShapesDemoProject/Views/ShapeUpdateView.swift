//
//  ShapeUpdateView.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/21/25.
//

import SwiftUI

struct ShapeUpdateView: View {
    @ObservedObject var viewModel: ShapesViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.listOfShapes) { item in
                        if item.type == .circle {
                            CircularView()
                        }
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Button("Delete All") {
                    viewModel.removeShapesByType(shapeItemType: .circle)
                }
                Spacer()
                Button("Add") {
                    viewModel.addNewShapeInListByType(shapeType: .circle)
                }
                Spacer()
                Button("Remove") {
                    if let itemId = viewModel.listOfShapes.last(where: { $0.type == .circle })?.id {
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
