//
//  FirstView.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 17/06/1444 AH.
//

import SwiftUI

struct FirstView: View {
    @State private var isActive = false
    var body: some View {
        ZStack{
            VStack{
                if isActive {
                   ObjectsView()
                    
                }else{
                    Logoanimation()
                    
                }
            }.onAppear(){
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8){
                    self.isActive = true
                    
                }
            }
            }
           
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

struct Logoanimation: View {
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    
    var body: some View {
        
        
        ZStack{
            
            ZStack{
                Color.accentColor
                    .ignoresSafeArea()
                
                VStack(spacing: -70){
             
                        Image("LogoImage")
                            .resizable()
                            .frame(width: 350.0, height: 450.0)
                          
                        Text("Learn colors with fun")
                            .font(.body)
                            .foregroundColor(Color.green)
                        
                   
                }
                
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.5)){
                        self.size = 1.3
                        self.opacity = 1.0
                    }
                }
                
             
                
                
            }
        }
        
    }
}
