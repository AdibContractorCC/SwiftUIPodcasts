//
//  ContentView.swift
//  iHeartRadioSwiftUI
//
//  Created by Adib Contractor on 6/4/19.
//  Copyright © 2019 iHeartMedia. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView {
            List {
                VStack {
                    PopularPodcastsRow(podcastList: podcastDirectory.popular)
                    Divider()
                    FeaturedPodcastsRow(podcastList: podcastDirectory.featured)
                    Divider()
                    CategoriesGrid(categories: podcastDirectory.categories)
                    }
                    .navigationBarTitle(Text("Podcasts"), displayMode: .inline)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
