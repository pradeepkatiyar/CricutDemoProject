//
//  RectangleView.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/21/25.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        Rectangle()
            .fill(Color.pacificBlue)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    RectangleView()
}
