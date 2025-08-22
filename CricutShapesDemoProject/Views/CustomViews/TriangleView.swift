//
//  TriangleView.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/21/25.
//

import SwiftUI

struct TriangleView: View {
    var body: some View {
        Triangle()
            .fill(Color.pacificBlue)
            .frame(width: 100, height: 100)
            .padding()
    }
}

// Make Triangular Path
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    TriangleView()
}
