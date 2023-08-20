//
//  QuestionBoxView.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import SwiftUI

struct QuestionBoxView: View {
    var questionNumber: Int
    var question: String
    
    var body: some View {
        ZStack {
            Image("QuestionBox")
                .resizable()
                .scaledToFit()
                .frame(height: 110)
            VStack {
                Text("Soal \(questionNumber)")
                    .font(.system(size: 14, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 1.0, green: 0.41, blue: 0.403))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2)
                Text(question)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 320)
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
}

struct QuestionBoxView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionBoxView(questionNumber: 1, question: "")
    }
}
