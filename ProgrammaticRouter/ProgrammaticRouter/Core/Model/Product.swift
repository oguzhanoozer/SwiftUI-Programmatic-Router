//
//  Product.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let category: ProductCategory
    var isFavorite: Bool
    let stock: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
}


enum ProductCategory: String {
    case electronics = "Elektronik"
    case clothing = "Giyim"
    case books = "Kitaplar"
    case sports = "Spor"
}

