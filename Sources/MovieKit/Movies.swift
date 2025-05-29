//
//  Movies.swift
//  MovieKit
//
//  Created by Mohammad Komeili on 28.05.25.
//

import Foundation

// MARK: - Main Response
public struct MovieResponse: Codable, Sendable {
    public let dates: DateRange?
    public let page: Int
    public let results: [Movie]
    public let totalPages: Int
    public let totalResults: Int
    
    public init(dates: DateRange?, page: Int, results: [Movie], totalPages: Int, totalResults: Int) {
        self.dates = dates
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
    
    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Movie
public struct Movie: Codable, Sendable, Identifiable {
    public let adult: Bool
    public let backdropPath: String?
    public let genreIds: [Int]
    public let id: Int
    public let originalLanguage: String
    public let originalTitle: String
    public let overview: String
    public let popularity: Double
    public let posterPath: String?
    public let releaseDate: String
    public let title: String
    public let video: Bool
    public let voteAverage: Double
    public let voteCount: Int
    
    public init(adult: Bool, backdropPath: String?, genreIds: [Int], id: Int, originalLanguage: String, originalTitle: String, overview: String, popularity: Double, posterPath: String?, releaseDate: String, title: String, video: Bool, voteAverage: Double, voteCount: Int) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    enum CodingKeys: String, CodingKey {
        case adult, id, overview, popularity, title, video
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Date Range
public struct DateRange: Codable, Sendable {
    public let maximum: String
    public let minimum: String
    
    public init(maximum: String, minimum: String) {
        self.maximum = maximum
        self.minimum = minimum
    }
}

// MARK: - Helpers
extension Movie {
    public func backdropURL(size: String = "w500") -> URL? {
        guard let backdropPath = backdropPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/\(size)\(backdropPath)")
    }
    
    public func posterURL(size: String = "w500") -> URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/\(size)\(posterPath)")
    }
    
    public var releaseDateAsDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: releaseDate)
    }
    
    public var formattedReleasedDate: String? {
        guard let date = releaseDateAsDate else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    public var formattedRating: String {
        return String(format: "%.1f/10", voteAverage)
    }
    
    public var genres: [String] {
        return genreIds.compactMap { id in
            MovieGenre(rawValue: id)?.name
        }
    }
}

// MARK: - Preview Data
#if DEBUG
extension Movie {
    public static let previews: [Movie] = [
        Movie(
            adult: false,
            backdropPath: "/nDxJJyA5giRhXx96q1sWbOUjMBI.jpg",
            genreIds: [28, 35, 14],
            id: 594767,
            originalLanguage: "en",
            originalTitle: "Shazam! Fury of the Gods",
            overview: "Billy Batson and his foster siblings, who transform into superheroes by saying \"Shazam!\", are forced to get back into action and fight the Daughters of Atlas.",
            popularity: 4274.232,
            posterPath: "/2VK4d3mqqTc7LVZLnLPeRiPaJ71.jpg",
            releaseDate: "2023-03-15",
            title: "Shazam! Fury of the Gods",
            video: false,
            voteAverage: 6.9,
            voteCount: 1231
        ),
        Movie(
            adult: false,
            backdropPath: "/h8gHn0OzBoaefsYseUByqsmEDMY.jpg",
            genreIds: [28, 53, 80],
            id: 603692,
            originalLanguage: "en",
            originalTitle: "John Wick: Chapter 4",
            overview: "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table.",
            popularity: 1320.735,
            posterPath: "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
            releaseDate: "2023-03-22",
            title: "John Wick: Chapter 4",
            video: false,
            voteAverage: 8.0,
            voteCount: 1211
        )
    ]
}
#endif
