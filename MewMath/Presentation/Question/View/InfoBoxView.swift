//
//  InfoBoxView.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import SwiftUI

struct InfoBoxView: View {
    var text: String
    
    @State private var opacity = 0.0
    @State private var scale = 0.7
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color("Green"))
            .frame(height: 50)
            .overlay(
                HStack {
                    Image("HintIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                    Text(text)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                }
            )
            .padding(.horizontal, 30)
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

struct InfoBoxView_Previews: PreviewProvider {
    static var previews: some View {
        InfoBoxView(text: "")
    }
}
