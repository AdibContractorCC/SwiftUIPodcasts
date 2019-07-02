//
//  CategoriesGrid.swift
//  iHeartRadioSwiftUI
//
//  Created by Adib Contractor on 6/9/19.
//  Copyright © 2019 iHeartMedia. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categories: [PodcastCategory]
    
    var body: some View {
        HStack(alignment: .top) {
            ForEach(categories) { category in
                Image(category.imageName)
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .frame(width: 190, height: 190)
            }
        }
    }
}

struct CategoriesGrid: View {
    var categories: [PodcastCategory]
    var itemsPerRow: Int {
        return Int(UIScreen.main.bounds.width/200)-1
    }
    
    var body: some View {
        var lowerBound = 0
        var upperBound = itemsPerRow
        var categoryRows: [[PodcastCategory]] = []
        
        while lowerBound < categories.count {
            if upperBound >= categories.count {
                upperBound = categories.count - 1
            }
            categoryRows.append(Array(categories[lowerBound...upperBound]))
            lowerBound+=itemsPerRow+1
            upperBound+=itemsPerRow+1
        }
        
        return VStack(alignment: .leading) {
            ForEach(categoryRows.identified(by: \.self)) { categoryRow in
                CategoryRow(categories: categoryRow)
            }
        }
        .padding()
    }
}

#if DEBUG
struct CategoriesGrid_Previews : PreviewProvider {
    static let sampleCategories: [PodcastCategory] = [
        PodcastCategory(id: 1, name: ""),
        PodcastCategory(id: 2, name: ""),
        PodcastCategory(id: 3, name: ""),
        PodcastCategory(id: 4, name: ""),
        PodcastCategory(id: 5, name: ""),
        PodcastCategory(id: 6, name: ""),
        PodcastCategory(id: 7, name: ""),
        PodcastCategory(id: 8, name: ""),
        PodcastCategory(id: 9, name: ""),
        PodcastCategory(id: 10, name: ""),
        PodcastCategory(id: 11, name: ""),
        PodcastCategory(id: 12, name: ""),
        PodcastCategory(id: 13, name: ""),
        PodcastCategory(id: 14, name: ""),
        PodcastCategory(id: 15, name: ""),
        PodcastCategory(id: 16, name: ""),
        PodcastCategory(id: 17, name: ""),
        PodcastCategory(id: 18, name: ""),
        PodcastCategory(id: 19, name: "")
    ]
    
    static var previews: some View {
        CategoriesGrid(categories: sampleCategories)
    }
}
#endif
