//
//  ContentView.swift
//  PracticalGuideToMatchedGeometryEffectInSwiftUI
//
//  Created by ramil on 29.04.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            example1.tabItem { Image(systemName: "1.circle") }
            example2.tabItem { Image(systemName: "2.circle") }
            example3.tabItem { Image(systemName: "3.circle") }
        }
    }
    
    @State private var swap = false
    
    private var example1: some View {
        HStack(spacing: 50) {
            if swap {
                Circle()
                    .fill(Color.orange)
                    .frame(width: 100, height: 100)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
            } else {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                Circle()
                    .fill(Color.orange)
                    .frame(width: 100, height: 100)
            }
        }.onTapGesture {
            withAnimation {
                swap.toggle()
            }
        }
    }
    
    @State private var swap2 = false
    @Namespace private var matchAnimation
    
    private var example2: some View {
        HStack(spacing: 50) {
            if swap {
                Circle()
                    .fill(Color.orange)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "orangeCircle", in: matchAnimation)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "blueCircle", in: matchAnimation)
            } else {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "blueCircle", in: matchAnimation)
                Circle()
                    .fill(Color.orange)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "orangeCircle", in: matchAnimation)
            }
        }.onTapGesture {
            withAnimation {
                swap.toggle()
            }
        }
    }
    
    @State private var expand = false
    @Namespace private var photoNamespace
    
    private var example3: some View {
        VStack {
            VStack(spacing: 50) {
                HStack {
                    Image("p1")
                        .resizable()
                        .cornerRadius(expand ? 150 : 22)
                        .frame(width: expand ? 300 : 44, height: expand ? 300 : 44)
                        .padding(.top, expand ? 20 : 0)
                    
                    if expand == false {
                        Text("Zen Phone")
                            .matchedGeometryEffect(id: "photo", in: photoNamespace)
                            .font(.headline)
                        Spacer()
                    }
                }
                
                if expand {
                    Text("Zen Phone")
                        .matchedGeometryEffect(id: "photo", in: photoNamespace)
                        .font(.headline)
                        .padding(.bottom, 60)
                }
                
            }.onTapGesture {
                withAnimation(.easeInOut) {
                    expand.toggle()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(expand ? 400 : 0)
            .foregroundColor(.black)
            .padding(expand ? 10 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
