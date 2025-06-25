//
//  ViewModel.swift
//  TakeHomeTest
//
//  Created by Stein Alver on 25/06/2025.
//

import Foundation

extension ContentView {
    
    enum LoadState {
        case loading, loaded, failed
    }
    
    @Observable @MainActor
    class ViewModel {
        private(set) var articles = [Article]()
        
        private(set) var loadState = LoadState.loading
        private(set) var loadError: (any Error)?
        
        var filterText = ""
        
        var filteredArticles: [Article] {
            if filterText.isEmpty {
                articles
            } else {
                articles.filter {
                    $0.title.localizedStandardContains(filterText)
                }
            }
        }
        
        func loadArticles() async {
            loadState = .loading
            
            do {
                let url = URL(string: "https://hws.dev/news")!
                let (data, _) = try await URLSession.shared.data(from: url)

                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                articles = try decoder.decode([Article].self, from: data)
                loadState = .loaded
            } catch {
                loadState = .failed
                loadError = error
                print(error.localizedDescription)
            }
        }
    }
}
