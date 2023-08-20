//
//  HomeView.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import SwiftUI

struct HomeView: View {
    @State var catHeadAngel: CGFloat = 5
    @State private var scale: CGFloat = 0.7
    
    var body: some View{
        NavigationStack() {
            ZStack {
                Color("BgBlue")
                    .edgesIgnoringSafeArea(.all)
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
                    }
                    .padding(.top, 40)
                    Spacer()
                }
                VStack {
                    NavigationLink(
                        destination: MapView(),
                        label: {
                            BtnPlay()
                        }
                    )
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            scale = 1.0
                        }
                    }
                }
                VStack {
                    Spacer()
                    Image("LandMain")
                        .resizable()
                        .scaledToFit()
                }
                .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    ZStack {
                        Image("Cat-body")
                            .resizable()
                            .frame(width: 235, height: 225)
                        Image("Cat-head")
                            .resizable()
                            .frame(width: 235, height: 225)
                            .rotationEffect(.degrees(catHeadAngel))
                            .onAppear{
                                withAnimation(
                                    .easeInOut(duration: 1.0)
                                    .repeatForever(autoreverses: true)
                                ) {
                                    catHeadAngel = -5
                                }
                            }
                    }
                }
                VStack {
                    HStack {
                        Image("Ballon1")
                            .scaledToFit()
                            .padding(.leading, 30)
                        Spacer()
                        Image("Ballon2")
                            .scaledToFit()
                            .padding(.trailing, 35)
                    }
                    .padding(.top, 250)
                }
            }
        }
    }
}

private struct BtnPlay: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 140, height: 140)
                .foregroundColor(.white)
                .shadow(color: Color("PinkShadow").opacity(0.8), radius: 10)
            Image(systemName: "play.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .foregroundColor(Color("Pink"))
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
