//
//  MapView.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import SwiftUI

struct MapView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isMuted = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color("BgGreenG1"), Color("BgGreenG2")]),
                    startPoint: .top,
                    endPoint: .bottom
                ).ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    Image("LandMap")
                        .resizable()
                        .scaledToFit()
                }.ignoresSafeArea(.all)
                VStack {
                    Image("CatPath")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, 60)
                }
                ObjTrees()
                VStack {
                    Spacer()
                    Image("CatMap")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                }.ignoresSafeArea(.all)
                VStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            BtnBack()
                        }
                        Spacer()
                        Button(action: {
                            self.isMuted.toggle()
                            isMuted ? MusicPlayer.shared.stopBackgroundMusic() : MusicPlayer.shared.startBackgroundMusic()
                        }) {
                            if isMuted {
                                BtnSilent()
                            } else {
                                BtnSound()
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                VStack {
                    Image("Flag")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                ObjLevel()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct BtnBack: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("Pink"))
                .frame(width: 50)
                .shadow(color: Color("PinkShadow").opacity(0.8),radius: 10)
            Image(systemName: "arrowshape.backward.fill")
                .resizable()
                .foregroundColor(.white)
                .scaledToFill()
                .frame(width: 22, height: 22)
        }
    }
}

struct BtnSound: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("Pink"))
                .frame(width: 50)
                .shadow(color: Color("PinkShadow").opacity(0.8),radius: 10)
            Image(systemName: "speaker.wave.2.fill")
                .resizable()
                .foregroundColor(.white)
                .scaledToFill()
                .frame(width: 22, height: 22)
        }
    }
}

struct BtnSilent: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("Pink"))
                .frame(width: 50)
                .shadow(color: Color("PinkShadow").opacity(0.8),radius: 10)
            Image(systemName: "speaker.slash.fill")
                .resizable()
                .foregroundColor(.white)
                .scaledToFill()
                .frame(width: 22, height: 22)
        }
    }
}

struct BtnLevel: View {
    var bgColorName: String
    var imageName: String
    var levelName: String = "🔒"
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 82)
                    .opacity(0.4)
                Circle()
                    .fill(Color(bgColorName))
                    .frame(width: 70)
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
            }
            Text(levelName)
                .foregroundColor(.white)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .shadow(color: .white.opacity(0.8), radius: 5)
        }
    }
}

struct ObjTrees: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("Tree1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 50)
            }
            VStack {
                HStack {
                    Image("Tree2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.top, 130)
            }
            VStack {
                HStack {
                    Spacer()
                    Image("Tree3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 130)
            }
            VStack {
                HStack {
                    Image("Tree4")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    Spacer()
                }
                .padding(.leading, 30)
                .padding(.bottom, 520)
            }
        }
    }
}

struct ObjLevel: View {
    var body: some View {
        Group {
            HStack {
                NavigationLink(destination: QuestionView1(), label: {
                    BtnLevel(bgColorName: "Pink", imageName: "Ball", levelName: "Bola Wol")
                })
                Spacer()
            }
            .padding(.leading, 70)
            .padding(.top, 340)
            HStack {
                Spacer()
                NavigationLink(destination: Question2View(), label: {
                    BtnLevel(bgColorName: "Pink", imageName: "Fish", levelName: "Ikan")
                })
            }
            .padding(.trailing, 70)
            .padding(.top, 310)
            BtnLevel(bgColorName: "Grey", imageName: "CatFootPrint")
            
                .padding(.top, 20)
            HStack {
                BtnLevel(bgColorName: "Grey", imageName: "CatFootPrint")
                Spacer()
            }
            .padding(.bottom, 270)
            .padding(.leading, 50)
            HStack {
                Spacer()
                BtnLevel(bgColorName: "Grey", imageName: "CatFootPrint")
            }
            .padding(.bottom, 310)
            .padding(.trailing, 70)
            
            BtnLevel(bgColorName: "Grey", imageName: "CatFootPrint")
                .padding(.bottom, 600)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
