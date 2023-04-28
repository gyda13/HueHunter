//
//  DraggableToy.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 16/06/1444 AH.
//

import SwiftUI

struct DraggableColor<Draggable: Gesture>: View {
    let color: Object
    let position: CGPoint 
    let gesture: Draggable
   
    private let size: CGFloat = 100
    
   
    
    var body: some View {
     
       
        Circle()
            .fill(color.color)
        
            .overlay(
                Text(color.colorname)
                    .foregroundColor(.black)
                    .bold()
                   )
            .frame(width: size, height: size)
            .shadow(radius: 8)
        
            .position(position)
            .gesture(gesture).environment(\.layoutDirection, .leftToRight)
            .offset(x: 0, y: -35)
       
       
    }
}

struct DraggableToy_Previews: PreviewProvider {
    static var previews: some View {
        DraggableColor(
            color: Object.sports.first!,
            position: .zero,
            gesture: DragGesture()
           
        )
            .previewInterfaceOrientation(.landscapeLeft)
            
    }
}

