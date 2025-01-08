//
//  CategoryView.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject private var router: Router
    let categoryId: Int
    
    var body: some View {
        VStack {
            Text("Category \(categoryId)")
            
            Button("Go To Product Lists") {
                router.navigate(to: .productList(categoryId: categoryId))
            }
        }
    }
}
