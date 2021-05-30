//
//  ContentView.swift
//  ViewBuilder
//
//  Created by 米国梁 on 2021/5/29.
//

import SwiftUI

struct Tom<HeadContent: View, FeetContent: View>: View {
    
    let headContent: () -> HeadContent
    let feetContent: () -> FeetContent
    
    init(@ViewBuilder headContent: @escaping () -> HeadContent,
                      @ViewBuilder feetContent: @escaping () -> FeetContent) {
        self.headContent = headContent
        self.feetContent = feetContent
    }
    
    var body: some View {
        
        Image("boy")
            .resizable()
            .overlay(VStack {
                headContent()
                    .frame(maxHeight: 200)
                Spacer()
                feetContent()
            })
    }
}

struct ContentView: View {
    
    let wear = true
    
    var body: some View {
        
        Tom {
            if wear {
                Image("hat")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: 10, y: -50)
            }
        } feetContent: {
            if wear {
                HStack(spacing: 20) {
                    
                    Image("boot")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 120)
                        .rotation3DEffect(
                            .degrees(180),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                    
                    Image("boot")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 120)
                }
                .offset(x: 8)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
