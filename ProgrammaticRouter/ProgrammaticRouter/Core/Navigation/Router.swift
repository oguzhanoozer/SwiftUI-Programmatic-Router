//
//  Router.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    // Go to a new route
    func navigate(to route: Route) {
        path.append(route)
    }
    
    // Return to previous page
    func navigateBack() {
        path.removeLast()
    }
    
    // Return to home page
    func navigateToRoot() {
        path.removeLast(path.count)
    }
    
    // Go back to a specific view
    func popToView(count: Int) {
        path.removeLast(count)
    }
}

extension Router {
    func canNavigateBack() -> Bool {
        return path.count > 0
    }
}
