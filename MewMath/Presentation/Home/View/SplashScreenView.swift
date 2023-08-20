//
//  SplashScreenView.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isAnimate: Bool = false
    
    var body: some View {
        ZStack {
            Color("BgBlue").edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Image("Cloud")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 210, maxHeight: 120)
                        .offset(x: -170)
                    Image("Cloud")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 170, maxHeight: 110)
                        .offset(y: 80)
                    Image("Cloud")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 230, maxHeight: 100)
                        .offset(x: 150, y: -30)
                }.padding(.top, 40)
                Spacer()
            }
            VStack {
                Image("Title")
                    .resizable()
                    .shadow(
                        color: Color(
                            red: 255 / 255,
                            green: 104 / 255,
                            blue: 103 / 255).opacity(0.5),
                        radius: 10
                    )
                    .frame(width: 149, height: 26)
                    .scaleEffect(isAnimate ? 2 : 1)
                    .onAppear() {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            isAnimate = true
                        }
                    }
            }
            VStack {
                Spacer()
                ZStack{
                    Image("Land")
                        .resizable()
                        .scaledToFit()
                    HStack{
                        Text("Music Copyright")
                        Label("syncopika", systemImage: "c.circle")
                    }
                    .font(.footnote)
                    .opacity(0.5)
                    .padding(.top, 200)
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
