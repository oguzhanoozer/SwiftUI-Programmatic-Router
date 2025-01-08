//
//  MainView.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            HomeView()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .home:
                        HomeView()
                    case .detail(let id):
                        DetailView(id: id)
                    case .profile(let username):
                        ProfileView(username: username)
                    case .settings:
                        SettingsView()
                    case .categories(let categoryId):
                        CategoryView(categoryId: categoryId)
                    case .productList(let categoryId):
                        ProductListView(categoryId: categoryId)
                    case .productDetail(let productId):
                        ProductDetailView(router: router, productId: productId)
                    }
                }
        }
        .environmentObject(router)
    }
}
