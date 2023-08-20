//
//  MainView.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import SwiftUI

struct MainView: View {
    @AppStorage("isSplashScreen") var isSplashScreen = false
    
    var body: some View {
        if !isSplashScreen {
            SplashScreenView()
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            isSplashScreen = true
                        }
                    }
                }
        } else {
            HomeView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}