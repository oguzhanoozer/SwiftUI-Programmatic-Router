//
//  DetailView.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject private var router: Router
    let id: Int
    
    var body: some View {
        VStack {
            Text("Detail Page\(id)")
            
            Button("Go to Settings") {
                router.navigate(to: .settings)
            }
            
            Button("Return to Home") {
                router.navigateToRoot()
            }
            
            Button("Go Back") {
                router.navigateBack()
            }
        }
        .navigationTitle("Detail")
    }
}
