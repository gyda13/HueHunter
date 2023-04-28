//
//  FirstView.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 17/06/1444 AH.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    var body: some View {
        ZStack{
            VStack{
                if isActive {
                    OnboardingView()
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

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

struct Logoanimation: View {
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    
    var body: some View {
        
        
        ZStack{
            
            ZStack{
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                VStack(spacing: -70){
             
                        Image("LogoImage")
                            .resizable()
                            .frame(width: 257.0, height: 170.0)
                          

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
