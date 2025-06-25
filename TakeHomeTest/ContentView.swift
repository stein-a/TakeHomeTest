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
            List(viewModel.articles, rowContent: ArticleRow.init)
                .navigationTitle("Take Home Test")
                .navigationDestination(for: Article.self, destination: ArticleView.init)
        }
        .task(viewModel.loadArticles)
    }
    
}

#Preview {
    ContentView()
}
