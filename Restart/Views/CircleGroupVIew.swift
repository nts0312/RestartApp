//
//  CircleGroupVIew.swift
//  Restart
//
//  Created by Nitin Singh on 12/01/22.
//

import SwiftUI

struct CircleGroupVIew: View {
    
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//: ZSTACK
        .blur(radius:  isAnimating ? 0: 10)
        .opacity(isAnimating ? 1: 0)
        .scaleEffect(isAnimating ? 1: 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct CircleGroupVIew_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupVIew(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
