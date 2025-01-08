//
//  ProductListView.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject private var router: Router
    let categoryId: Int
    
    var body: some View {
        List(1...5, id: \.self) { productId in
            Button("Product \(productId)") {
                router.navigate(to: .productDetail(productId: productId))
            }
        }
    }
}
