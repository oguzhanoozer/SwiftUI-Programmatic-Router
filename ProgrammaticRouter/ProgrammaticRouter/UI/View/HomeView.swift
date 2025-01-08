//
//  HomeView.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Go To Profile") {
                router.navigate(to: .profile(username: "johndoe"))
            }
            
            Button("Go To Product Detail") {
                router.navigate(to: .productDetail(productId: 123))
            }
            
            Button("Go To Categories") {
                router.navigate(to: .categories(categoryId: 1))
            }
            Button("Go To Settings") {
                router.navigate(to: .settings)
            }
        }
        .navigationTitle("Home")
    }
}
