//
//  CarouselView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 27.02.2024.
//

import SwiftUI

struct CarouselView: View {
    
    
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State private var activeIndex: Int = 0
    @State private var showInfoView = false
    @StateObject var currentVM = CurrentRoundVM()
    
    
    var views: [CarouselViewChild] = placeholderCarouselChildView
    let testViews: [AnyView] = [
        AnyView(CurrentCardView().offset(y: 350)),
        AnyView(SecondPreviousCardView().offset(y: 350)),
        AnyView(PreviousCardView().offset(y: 350))
        
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("mainBG").ignoresSafeArea(.all)
                ZStack{
                    Text("Friends Of Little Yus")
                        .padding(.bottom, 450)
                        .font(.system(size: 20, weight: .bold, design: .default))
                    Text("Leaderboards")
                        .padding(.bottom, 400)
                        .font(.system(size: 20, weight: .medium, design: .default))
                    ForEach(views) { view in
                        view
                            .scaleEffect(1.0 - abs(distance(view.id)) * 0.2 )
                            .opacity(1.0 - abs(distance(view.id)) * 0.3 )
                            .offset(x: myXOffset(view.id), y: 0)
                            .zIndex(1.0 - abs(distance(view.id)) * 0.1)
                            .padding(.top, 70)
                    }
                    
                    ForEach(testViews.indices, id:\.self) { _ in
                        testViews[activeIndex]
                    }
                    
                }
                .foregroundStyle(.white)
                .padding(.bottom, 250)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            draggingItem = snappedItem + value.translation.width / 700
                        }
                        .onEnded { value in
                            withAnimation {
                                draggingItem = snappedItem + value.predictedEndTranslation.width / 700
                                draggingItem = round(draggingItem).remainder(dividingBy: Double(views.count))
                                snappedItem = draggingItem
                                
                                self.activeIndex = views.count + Int(draggingItem)
                                if self.activeIndex > views.count || Int(draggingItem) >= 0 {
                                    self.activeIndex = Int(draggingItem)
                                }
                            }
                        }
                )
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        InfoDetailView()
                    } label: {
                        Image(systemName: "info.square")
                            .foregroundStyle(.cyan)
                            .padding()
                    }


                }
            }
        }

    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(views.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(views.count) * distance(item)
        return sin(angle) * 200
    }
}

#Preview {
    CarouselView()
}

var placeholderCarouselChildView: [CarouselViewChild] = [
    
    
    
    CarouselViewChild(id: 1, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 18)
                .fill(Color("cardBG"))
            SecondPreviousView()
        }
        .frame(width: 350, height: 350)
        .padding()
    }),
    
    CarouselViewChild(id: 2, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 18)
                .fill(Color("cardBG"))
            PreviousBoardView()
        }
        .frame(width: 350, height: 350)
    }),
    
    CarouselViewChild(id: 3, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 18)
                .fill(Color("cardBG"))
            CurrentBoardView()
        }
        .frame(width: 350, height: 350)
    })
]
