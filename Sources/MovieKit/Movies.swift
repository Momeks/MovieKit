//
//  Movies.swift
//  MovieKit
//
//  Created by Mohammad Komeili on 28.05.25.
//

import Foundation

public struct MoviesResponse: Codable, Sendable {
    public let dates: DateRange
    public let page: Int
    public let results: [Movie]
    public let totalPages: Int
    public let totalResults: Int
    
    public enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    public init(
        dates: DateRange?,
        page: Int,
        results: [Movie],
        totalPages: Int,
        totalResults: Int
    ) {
        self.dates = dates ?? DateRange(maximum: "1970-01-01", minimum: "1970-01-01")
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

public struct DateRange: Codable, Sendable {
    public let maximum: String
    public let minimum: String
    
    public init(maximum: String, minimum: String) {
        self.maximum = maximum
        self.minimum = minimum
    }
}

public struct Movie: Codable, Sendable {
    public let id: Int
    public let adult: Bool
    public let backdropPath: String?
    public let genreIds: [Int]
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
    
    public enum CodingKeys: String, CodingKey {
        case id, adult, overview, popularity, title, video
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    public init(
        id: Int,
        adult: Bool,
        backdropPath: String?,
        genreIds: [Int],
        originalLanguage: String,
        originalTitle: String,
        overview: String,
        popularity: Double,
        posterPath: String?,
        releaseDate: String,
        title: String,
        video: Bool,
        voteAverage: Double,
        voteCount: Int
    ) {
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIds = genreIds
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
}

// MARK: - Helpers
public extension Movie {
    var posterURL: URL? {
        guard let path = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
    
    var backdropURL: URL? {
        guard let path = backdropPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w780\(path)")
    }
}

// MARK: - Preview
#if DEBUG
public extension Movies {
    static let preview: Movies = Movies(
        dates: DateRange(maximum: "2023-05-03", minimum: "2023-03-16"),
        page: 1,
        results: [
            Movie(
                id: 502356,
                adult: false,
                backdropPath: "/iJQIbOPm81fPEGKt5BPuZmfnA54.jpg",
                genreIds: [16, 12, 10751, 14, 35],
                originalLanguage: "en",
                originalTitle: "The Super Mario Bros. Movie",
                overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
                popularity: 6572.614,
                posterPath: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
                releaseDate: "2023-04-05",
                title: "The Super Mario Bros. Movie",
                video: false,
                voteAverage: 7.5,
                voteCount: 1456
            ),
            Movie(
                id: 594767,
                adult: false,
                backdropPath: "/nDxJJyA5giRhXx96q1sWbOUjMBI.jpg",
                genreIds: [28, 35, 14],
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
            )
        ],
        totalPages: 87,
        totalResults: 1734
    )
}
#endif
