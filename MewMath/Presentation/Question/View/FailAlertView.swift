//
//  FailAlertView.swift
//  MewMath
//
//  Created by Agung Saputra on 18/08/23.
//

import SwiftUI

struct FailAlertView: View {
    @State private var opacity = 0.0
    @State private var scale = 0.7
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color("BrokenWhite"))
                .frame(height: 150)
                .overlay(
                    VStack {
                        Text("Maaf kamu salah, coba lagi!")
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                    }
                )
                .padding(.all, 100)
                .scaleEffect(scale)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                        opacity = 1.0
                        scale = 1.0
                    }
                }
        }
    }
}

struct FailAlertView_Previews: PreviewProvider {
    static var previews: some View {
        FailAlertView()
    }
}
