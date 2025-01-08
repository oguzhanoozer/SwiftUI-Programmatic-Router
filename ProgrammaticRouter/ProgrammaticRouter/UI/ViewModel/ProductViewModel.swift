//
//  ProductViewModel.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import SwiftUI


class ProductViewModel: ObservableObject {
    @Published var product: Product?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func loadProduct(id: Int) {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.product = Product(
                id: id,
                name: "iPhone 14 Pro",
                description: "Apple iPhone 14 Pro 256GB",
                price: 39999.99,
                imageURL: "iphone14pro_image",
                category: .electronics,
                isFavorite: false,
                stock: 10
            )
            self.isLoading = false
        }
    }
    
    func toggleFavorite() {
        product?.isFavorite.toggle()
    }
    
    func navigateToRelatedProduct(id: Int) {
        router.navigate(to: .productDetail(productId: id))
    }
    
    func backToList() {
        router.navigateBack()
    }
    
    func addToCart() {
    
        print("Product added to basket")
        router.navigateBack()
    }
}
