//
//  CircularView.swift
//  CricutShapesDemoProject
//
//  Created by Pradeep Katiyar on 8/21/25.
//

import SwiftUI

struct CircularView: View {
    var body: some View {
        Circle()
            .fill(Color.pacificBlue)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    CircularView()
}
