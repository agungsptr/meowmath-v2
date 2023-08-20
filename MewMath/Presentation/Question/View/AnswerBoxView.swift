//
//  AnswerBoxView.swift
//  MewMath
//
//  Created by Agung Saputra on 19/08/23.
//

import SwiftUI

struct AnswerBoxView: View {
    var selectedBox: Int
    @Binding var answerList: [String]
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(selectedBox == 1 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answerList[0])
                    .font(.system(size: 40, design: .rounded))
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(selectedBox == 4 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answerList[1])
                    .font(.system(size: 40, design: .rounded))
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(selectedBox == 3 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answerList[2])
                    .font(.system(size: 40, design: .rounded))
            }
            Text("=")
                .font(.system(size: 40, design: .rounded))
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(selectedBox == 5 ? Color("Pink") : Color("Green"), lineWidth: 3)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("Green")))
                    .foregroundColor(Color("Green"))
                    .frame(width: 70, height: 70)
                Text(answerList[3])
                    .font(.system(size: 40, design: .rounded))
            }
        }
    }
}

struct AnswerBoxView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerBoxView(selectedBox: 1, answerList: .constant(["0", "0", "0", "0"]))
    }
}
