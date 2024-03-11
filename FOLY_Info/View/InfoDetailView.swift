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
                                .multilineTextAlignment(.leading)
                                .padding()
                        }
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
        }
    }
}

struct FAQItem {
    var question: String
    var answer: String
}

let faqList = [
    FAQItem(question: "What is the FOLY ?",
            answer: "FOLY : Friends Of Little Yus"),
    FAQItem(question: "Who is the Emsy ?",
            answer: "Emsy is a Block Producer for Solar Network."),
//    FAQItem(question: "Soru 3", answer: "Cevap 3"),
//    FAQItem(question: "Soru 4", answer: "Cevap 4"),
//    FAQItem(question: "Soru 5", answer: "Cevap 5"),
//    FAQItem(question: "Soru 6", answer: "Cevap 6"),
//    FAQItem(question: "Soru 7", answer: "Cevap 7"),
]

#Preview {
    InfoDetailView()
}
