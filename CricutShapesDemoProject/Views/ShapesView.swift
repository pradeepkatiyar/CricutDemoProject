//
//  ShapesView.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/21/25.
//

import SwiftUI

struct ShapesView: View {
    @StateObject private var viewModel = ShapesViewModel()
    @State private var navigationPath = [NavigationRoute]()
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                HStack {
                    Button("Clear All") {
                        viewModel.removeAllShapes()
                    }
                    .font(.body.weight(.medium))
                    Spacer()
                    Button("Edit Circles") {
                        navigationPath.append(.shapeUpdate)
                    }
                    .font(.body.weight(.medium))
                }
                .buttonStyle(.borderless)
                .font(.headline)
                
                Spacer()
                
                if !viewModel.buttons.isEmpty {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.listOfShapes) { item in
                                switch item.type {
                                case .circle:
                                    CircularView()
                                case .square:
                                    RectangleView()
                                case .triangle:
                                    TriangleView()
                                }
                            }
                        }
                    }
                    HStack {
                        ForEach(viewModel.buttons, id: \.name) { button in
                            Button(button.name) {
                                viewModel.addNewShapeInListByType(shapeType: button.drawPath)
                            }
                            if button != viewModel.buttons.last {
                                Spacer()
                            }
                        }
                    }
                    .buttonStyle(.borderless)
                    .font(.headline)
                    .padding(.vertical, 10)
                } else {
                    ProgressView("Loading Shapes...")
                }
            }
            .padding()
            .task {
                await viewModel.fetchShapesAndButtons()
            }
            .navigationDestination(for: NavigationRoute.self) { destination in
                switch destination {
                case .shapeUpdate:
                    ShapeUpdateView(viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    ShapesView()
}
