//
//  Categories.swift
//  Netflix
//
//  Created by ********* on 31/05/2020.
//

import Foundation


enum Category: String, CaseIterable, CustomStringConvertible, Identifiable {
    var id: UUID {
        UUID()
    }
    
    
    case trending
    case standUp
    case newRelease
    case watchItAgain
    case international
    
    var description: String {
        switch self {
        case .trending:
            return "Trending Now"
        case .standUp:
            return "Stand-Up Comedy"
        case .newRelease:
            return "New Release"
        case .watchItAgain:
            return "Watch It Again"
        case .international:
            return "International TV Show"
        }
    }

    
}

enum MovieType: String, CaseIterable, CustomStringConvertible, Identifiable {
    var id: UUID {
        UUID()
    }
    
    case comedy
    case dystopian
    case scifi
    case horror
    case crime
    
    var description: String {
        switch self {
        case .comedy:
            return "Comedy"
        case .dystopian:
            return "Dystopian"
        case .scifi:
            return "Sci-Fi TV"
        case .horror:
            return "Horror"
        case .crime:
            return "Crime"
        }
    }

    
}
