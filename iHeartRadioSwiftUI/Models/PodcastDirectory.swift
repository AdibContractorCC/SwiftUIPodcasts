//
//  PodcastDirectory.swift
//  iHeartRadioSwiftUI
//
//  Created by Adib Contractor on 6/9/19.
//  Copyright © 2019 iHeartMedia. All rights reserved.
//

import SwiftUI
import Foundation

let podcastDirectory: PodcastDirectory = load("podcast_directory.json")

struct PodcastDirectory: Hashable, Codable {
    var popular: PodcastList
    var featured: PodcastList
    var categories: [Category]
}

struct PodcastList: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var podcasts: [Podcast]
}

struct Category: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String {
        get {
            return "cat_\(Int.random(in: 1...22))"
        }
    }
}

struct Podcast: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var subtitle: String
    var description: String
    
    var imageName: String {
        get {
            return "\(Int.random(in: 1...35))"
        }
    }
}

// MARK: JSON Load

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
