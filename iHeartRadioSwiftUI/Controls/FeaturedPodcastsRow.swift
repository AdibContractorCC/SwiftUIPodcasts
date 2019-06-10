//
//  FeaturedPodcastsRow.swift
//  iHeartRadioSwiftUI
//
//  Created by Adib Contractor on 6/9/19.
//  Copyright © 2019 iHeartMedia. All rights reserved.
//

import SwiftUI

struct FeaturedPodcastsCell: View {
    var podcast: Podcast
    
    var body: some View {
        HStack {
            Image(podcast.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: ContentMode.fit)
            VStack(alignment: .leading) {
                Text(podcast.title)
                    .font(.subheadline)
                Text(podcast.subtitle)
                    .font(.caption)
                    .lineLimit(3)
            }
        }
            .frame(width: 300, height: 100)
    }
}

struct FeaturedPodcastsRow : View {
    var podcastList: PodcastList
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(podcastList.name)
                .font(.headline)
            
            ScrollView(showsHorizontalIndicator: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(podcastList.podcasts) { podcast in
                        FeaturedPodcastsCell(podcast: podcast)
                        Spacer()
                    }
                }
            }
                .frame(height: 120)
        }
    }
}

#if DEBUG
struct FeaturedPodcastsRow_Previews : PreviewProvider {
    static let samplePodcasts: [Podcast] = [
        Podcast(id: 28457192,
                title: "Rough Translation",
                subtitle: "How are the things we're talking about being talked about somewhere else in the world? Gregory…",
                description: "How are the things we're talking about being talked about somewhere else in \r\nthe world? Gregory Warner tells stories that follow familiar conversations \r\ninto unfamiliar territory. At a time when the world seems small but it's as \r\nhard as ever to escape our echo chambers, Rough Translation takes you \r\nplaces."),
        Podcast(id: 28440719,
                title: "Scrubbing In with Becca Tilley & Tanya Rad",
                subtitle: "We need a crash cart! Scrub in each week with Becca Tilley and her BFF Tanya Rad as they fangirl over their favorite shows, work through boy troubles, and hang out with the biggest celebrity guests. ",
                description: "We need a crash cart! Scrub in each week with Becca Tilley and her BFF Tanya Rad as they fangirl over their favorite shows, work through boy troubles, and hang out with the biggest celebrity guests. After first gaining notoriety on Season 19 and 20 of The Bachelor, Becca is now on a Dr. Pepper fueled journey to see as much of the world as she can, go on adventures with her friends and family, and find the best shows that TV has to offer.Her best friend Tanya spends her mornings as the co-host for On Air with Ryan Seacrest on KIIS-FM in Los Angeles, and the rest of her time goes to navigating the dating scene, Facetiming Becca, and going to bed early.It’s like hanging out with your best friends, all from the comfort of the OR! It’s Scrubbing In with Becca Tilley and Tanya Rad, on iHeartRadio or wherever you listen to podcasts."),
        Podcast(id: 27959911,
                title: "The Joe Rogan Experience",
                subtitle: "Conduit to the Gaian Mind",
                description: "Winner of the iHeartRadio Podcast Award for Best Comedy Podcast - Conduit to the Gaian Mind"),
        Podcast(id: 28076606,
                title: "The Daily",
                subtitle: "This is what the news should sound like. The biggest stories of our time, told by the best journalists in the world. Hosted by Michael Barbaro. Twenty minutes a day, five days a week, ready by 6 a.m.",
                description: "\r\nThis is what the news should sound like. The biggest stories of our time, \r\ntold by the best journalists in the world. Hosted by Michael Barbaro. \r\nTwenty minutes a day, five days a week, ready by 6 a.m.\r\n"),
        Podcast(id: 28178102,
                title: "The Ben Shapiro Show",
                subtitle: "Tired of the lies? Tired of the spin? Are you ready to hear the hard-hitting truth in comprehensive, conservative, principled fashion? The Ben Shapiro Show brings you all the news you need to know in the most fast moving daily program in America. Ben brutally breaks down the culture and never gives an inch! Monday thru Friday",
                description: "Winner of the iHeartRadio Podcast Award for Best News Podcast - Tired of the lies? Tired of the spin? Are you ready to hear the \r\nhard-hitting truth in comprehensive, conservative, principled fashion? The \r\nBen Shapiro Show brings you all the news you need to know in the most fast \r\nmoving daily program in America. Ben brutally breaks down the culture and \r\nnever gives an inch! Monday thru Friday"),
        Podcast(id: 28165481,
                title: "The Ben and Ashley I Almost Famous Podcast",
                subtitle: "Fan Favorite and one of the most popular Bachelors Ben Higgins and Ashley Iaconetti, the not…",
                description: "Fan Favorite and one of the most popular Bachelors Ben Higgins and Ashley \r\nIaconetti, the notorious crier from ABC’s Bachelorette and Bachelor in \r\nParadise, will be covering everything relationships and breaking down the \r\nnew season of the Bachelorette. They will include interviews with \r\ncelebrities, past Bachelor and Bachelorette contestants, and interactions \r\nfrom their most loyal fans.\r\n"),
        Podcast(id: 18907507,
                title: "The Dave Ramsey Show",
                subtitle: "Audio Archives for the Dave Ramsey Show",
                description: "Audio Archives for the Dave Ramsey Show."),
        Podcast(id: 27722337,
                title: "BobbyCast",
                subtitle: "Bobby Bones brings a podcast from Bobby's house. From Bobby's mouth.",
                description: "Winner of the iHeartRadio Podcast Award for Best Music Podcast - Talking openly about anything and everything, Bobby Bones records the podcast from the comfort of his home where he brings in guests to chat on big, comfy chairs.")
    ]
    
    static var previews: some View {
        FeaturedPodcastsRow(podcastList: PodcastList(id: 1, name: "Featured", podcasts: samplePodcasts))
    }
}
#endif
