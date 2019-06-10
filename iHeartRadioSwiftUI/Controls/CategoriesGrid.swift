//
//  CategoriesGrid.swift
//  iHeartRadioSwiftUI
//
//  Created by Adib Contractor on 6/9/19.
//  Copyright © 2019 iHeartMedia. All rights reserved.
//

import SwiftUI

struct CategoryRow: View, Identifiable {
    var id: Int
    var category1: Category
    var category2: Category
    
    var body: some View {
        HStack(alignment: .top) {
            Image(category1.imageName)
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 190, height: 190)
            Image(category2.imageName)
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 190, height: 190)
        }
    }
}

struct CategoriesGrid: View {
    var categoryRows: [CategoryRow] = []
    
    init(categories: [Category]) {
        let count = categories.count % 2 == 0 ? categories.count : categories.count - 1
        var rowNumber = 0
        var i = 0
        while i < count {
            categoryRows.append(CategoryRow(id: rowNumber, category1: categories[i], category2: categories[i+1]))
            i+=2
            rowNumber+=1
        }
    }
    
    var body: some View {
        VStack {
            ForEach(categoryRows) { categoryRow in
                categoryRow
            }
        }
    }
}

#if DEBUG
struct CategoriesGrid_Previews : PreviewProvider {
    static let sampleCategories: [Category] = [
        Category(id: 1, name: ""),
        Category(id: 2, name: ""),
        Category(id: 3, name: ""),
        Category(id: 4, name: ""),
        Category(id: 5, name: ""),
        Category(id: 6, name: ""),
        Category(id: 7, name: ""),
        Category(id: 8, name: "")
    ]
    
    static var previews: some View {
        CategoriesGrid(categories: sampleCategories)
    }
}
#endif
