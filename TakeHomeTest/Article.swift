//
//  Article.swift
//  TakeHomeTest
//
//  Created by Stein Alver on 25/06/2025.
//

import Foundation

struct Article: Codable, Hashable, Identifiable {
    let id: String
    var title: String
    var text: String
}
