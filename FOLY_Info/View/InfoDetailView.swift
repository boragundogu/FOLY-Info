//
//  InfoDetailView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 11.03.2024.
//

import SwiftUI

struct InfoDetailView: View {
    var body: some View {
        ZStack {
            Color("mainBG").ignoresSafeArea(.all)
            VStack{
                ScrollView{
                    ForEach(faqList, id:\.question) { faq in
                        DisclosureGroup(faq.question) {
                            Text(faq.answer)
                                .fontWeight(.light)
                                .padding()
                        }
                        .fontWeight(.bold)
                        .padding(20)
                        .foregroundStyle(.white)
                        .background{
                            RoundedRectangle(cornerRadius: 12)
                                .padding(7)
                                .foregroundStyle(Color("cardBG"))
                        }
                    }
                }
            }
            .padding(.top, 50)
        }
    }
}

struct FAQItem {
    var question: String
    var answer: String
}

let faqList = [
    FAQItem(question: "Who is block producer emsy?",
            answer: "emsy is a full-stack developer for 8 years and counting and started blockchain development in 2017. Block producer emsy has worked on several projects and published many useful tools. As an experienced node operator emsy has a proven track record of running successful block producers on various DPoS networks. Providing high performance and reliable nodes is my top priority."),
    FAQItem(question: "Tell me more about Friends of Little Yus",
            answer: """
 Friends of Little Yus is a blockchain based game that runs on its own blockchain called Helios. Helios is a licensed fork of Solar Core that is the backbone of the game. Data such as character names, classes and scores are all stored on Helios. The game has a play to earn mechanic meaning that the players can win SXP whilst playing. So far over 13000 SXP has been rewarded to players! The prize pool rewards are provided by emsy.

The goal is simple, race towards the flag as fast as possible to set a score. Top 5 fastest players at the end of the round win SXP. Each week a new round with a new map starts meaning a fresh chance for everyone.
"""),
    FAQItem(question: "So I can earn free SXP playing a game?",
            answer: "Yes! The only thing you have to do is to get a spot in the top 5 before the round ends."),
    FAQItem(question: "Where can I play Friends of Little Yus?",
            answer: "The game is available on Steam, Windows, Mac and Linux are supported."),
    FAQItem(question: "But wait, there’s more!", 
            answer: "Always has been. If you vote for block producer emsy you can win more SXP according to your vote balance. You get a multiplier of 1.1 by voting with at least 100 SXP. The max multiplier is 2. "),
    FAQItem(question: "What are emsy’s his sharing rates?",
            answer: "emsy is sharing 90% of which 88% goes to the voters, the remaining 2% goes to the game prize pool. Payouts are daily at 8 UTC."),
    FAQItem(question: "Where can I find emsy’s proposal?",
            answer: "https://delegates.solar.org/delegates/emsy"),
]

#Preview {
    InfoDetailView()
}
