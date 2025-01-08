//
//  Route.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import Foundation

enum Route: Hashable {
    case home
    case detail(id: Int)
    case profile(username: String)
    case settings
    case categories(categoryId: Int)
    case productList(categoryId: Int)
    case productDetail(productId: Int)
}
