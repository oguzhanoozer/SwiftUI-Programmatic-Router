//
//  ProductDetailView.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject private var viewModel: ProductViewModel
    let productId: Int
    
    init(router: Router, productId: Int) {
        _viewModel = StateObject(wrappedValue: ProductViewModel(router: router))
        self.productId = productId
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let product = viewModel.product {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(product.name)
                                .font(.title)
                                .bold()
                            
                            Text(product.description)
                                .foregroundColor(.gray)
                            
                            Text("₺\(String(format: "%.2f", product.price))")
                                .font(.title2)
                                .foregroundColor(.blue)
                            
                            HStack {
                                Text("Category:")
                                Text(product.category.rawValue)
                                    .foregroundColor(.gray)
                            }
                            
                            HStack {
                                Text("Stock:")
                                Text("\(product.stock) piece")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        
                        HStack {
                            Button(action: { viewModel.addToCart() }) {
                                Text("Add to Cart")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            Button(action: { viewModel.toggleFavorite() }) {
                                Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(product.isFavorite ? .red : .gray)
                                    .padding()
                            }
                        }
                        .padding()
                    }
                }
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("Product Details")
        .onAppear {
            viewModel.loadProduct(id: productId)
        }
    }
}
