//
//  ContentView.swift
//  Animations
//
//  Created by Seah Park on 4/20/25.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    let letters = Array("Hello, SwiftUI!")
    
    @State private var animationAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    
    @State private var rotationY = 0.0
    @State private var fadeOutOpacity = 1.0
    @State private var tappedKorea = false
    
    var body: some View {
        
        // TODO: the other one which didn't get the choice <- scale down
        VStack(spacing: 30) {
            Button {
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                   rotationY += 360
                }
            } label: {
                Image("Korea")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 10)
                    .rotation3DEffect(.degrees(rotationY), axis: (x: 0, y: 1, z: 0))
            }
            
            Button {
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    fadeOutOpacity = 0.25
                }
            } label: {
                Image("US")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 10)
                    .opacity(fadeOutOpacity)
            }
        }.padding()
        
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 200, height: 200)
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.pivot)
//            }
//        }
//        .onTapGesture {
//            withAnimation {
//                isShowingRed.toggle()
//            }
//        }
        
//        Button("Tap me") {
//            withAnimation {
//                isShowingRed.toggle()
//            }
//        }
//        if isShowingRed {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
//                .transition(.asymmetric(insertion: .scale, removal: .opacity))
//        }
        
        // 드래곤 무브 ㅋㅋㅋ
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self) { num in
//                    Text(String(letters[num]))
//                        .padding(5)
//                        .font(.title)
//                        .background(enabled ? .blue : .red)
//                        .offset(dragAmount)
//                        .animation(.linear.delay(Double(num) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                }
//        )
        
//        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(.rect(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        dragAmount = .zero }
//            )
//            .animation(.bouncy, value: dragAmount)
        
//        Button("Tap") {
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .foregroundColor(.white)
//        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
//        .animation(.default, value: enabled)
        // this is so funny! 코너도 애니메이션 먹음!
        
        // 돌아가는 원 동전
//        Button("Coke") {
//            withAnimation(.spring(duration: 1, bounce: 0.5)) {
//                animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundStyle(.white)
//        .clipShape(.circle)
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))

//        VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(
//                .easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//            Button("Tap") {
//                animationAmount += 1
//            }
//            .padding(10)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//            
//            Spacer()
//            
//            Button("Tap Me") {
//                //            animationAmount += 1
//            }
//            .padding(50)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            //        .scaleEffect(animationAmount)
//            //        .blur(radius: (animationAmount - 1) * 3 )
//            .overlay(
//                Circle()
//                    .stroke(.red)
//                    .scaleEffect(animationAmount)
//                    .opacity(2 - animationAmount)
//                    .animation(
//                        .easeOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//                        ,
//                        value: animationAmount)
//            )
//            .onAppear {
//                animationAmount = 2
//            }
//        }
    }
}

#Preview {
    ContentView()
}
