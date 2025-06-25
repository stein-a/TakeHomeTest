//
//  ArticleImage.swift
//  TakeHomeTest
//
//  Created by Stein Alver on 25/06/2025.
//

import SwiftUI

struct ArticleImage: View {
    var imageURL: URL
    
    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            default:
                Image(systemName: "newspaper")
            }
        }
    }
}

#Preview {
    ArticleImage(imageURL: Article.example.image)
}
