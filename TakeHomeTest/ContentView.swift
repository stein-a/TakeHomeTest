//
//  ContentView.swift
//  TakeHomeTest
//
//  Created by Stein Alver on 25/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            switch viewModel.loadState {
                case .failed:
                    LoadFailedView(error: viewModel.loadError, retry: viewModel.loadArticles)
                default:
                    if viewModel.articles.isEmpty {
                        ProgressView("Loading…")
                            .controlSize(.extraLarge)
                    } else {
                        List(viewModel.filteredArticles, rowContent: ArticleRow.init)
                            .navigationDestination(for: Article.self, destination: ArticleView.init)
                            .navigationTitle("Take Home Test")
                            .refreshable(action: viewModel.loadArticles)
                            .searchable(text: $viewModel.filterText, prompt: "Filter articles")
                    }
                }
        }
        .task(viewModel.loadArticles)
    }
    
}

#Preview {
    ContentView()
}
