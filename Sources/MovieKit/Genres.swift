//
//  Genres.swift
//  MovieKit
//
//  Created by Mohammad Komeili on 28.05.25.
//

import Foundation

public enum Genres: Int, CaseIterable {
    case action = 28
    case adventure = 12
    case animation = 16
    case comedy = 35
    case crime = 80
    case documentary = 99
    case drama = 18
    case family = 10751
    case fantasy = 14
    case history = 36
    case horror = 27
    case music = 10402
    case mystery = 9648
    case romance = 10749
    case scienceFiction = 878
    case tvMovie = 10770
    case thriller = 53
    case war = 10752
    case western = 37

    public var localizedName: String {
        switch self {
        case .action: return "Action"
        case .adventure: return "Abenteuer"
        case .animation: return "Animation"
        case .comedy: return "Komödie"
        case .crime: return "Krimi"
        case .documentary: return "Dokumentarfilm"
        case .drama: return "Drama"
        case .family: return "Familie"
        case .fantasy: return "Fantasy"
        case .history: return "Historie"
        case .horror: return "Horror"
        case .music: return "Musik"
        case .mystery: return "Mystery"
        case .romance: return "Liebesfilm"
        case .scienceFiction: return "Science Fiction"
        case .tvMovie: return "TV-Film"
        case .thriller: return "Thriller"
        case .war: return "Kriegsfilm"
        case .western: return "Western"
        }
    }
}
