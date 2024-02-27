//
//  CarouselView.swift
//  FOLY_Info
//
//  Created by Bora Gündoğu on 27.02.2024.
//

import SwiftUI

struct CarouselView: View {
    
    
    var xDistance: Int = 150
    
    @State private var snappedItem = 1.0
    @State private var draggingItem = 1.0
    @State private var activeIndex: Int = 0
    
    var views: [CarouselViewChild] = placeholderCarouselChildView
    var capitons: [String] = ["bora", "bora2", "bora3"]
    
    var body: some View {
        ZStack{
            ForEach(views) { view in
                view
                    .scaleEffect(1.0 - abs(distance(view.id)) * 0.2)
                    .opacity(1.0 - abs(distance(view.id)) * 0.3)
                    .offset(x: getOffset(view.id), y: 0)
                    .zIndex(1.0 - abs(distance(view.id)) * 0.1)
            }
            
            Text(capitons[activeIndex])
                .padding(.top, 500)
            
             
        }
        .padding(.bottom, 250)
        .gesture (
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 300
                }
                .onEnded { value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 300
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
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item).remainder(dividingBy: Double(views.count)))
    }
    
    func getOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(views.count) * distance(item)
        return sin(angle) * Double(xDistance)
        
    }
}

#Preview {
    CarouselView()
}

var placeholderCarouselChildView: [CarouselViewChild] = [

    CarouselViewChild(id: 1, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.red)
            Text("1")
        }
        .frame(width: 350, height: 350)
        .padding()
    }),
    
    CarouselViewChild(id: 2, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.yellow)
            Text("2")
                .padding()
        }
        .frame(width: 350, height: 350)
    }),
    
    CarouselViewChild(id: 3, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.green)
            Text("3")
        }
        .frame(width: 350, height: 350)
    })
]
