//
//  OnboardingView.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 27/08/1444 AH.
//

import SwiftUI

struct OnboardingView: View {
    var imageNames: [String] = ["0", "1", "2", "3", "4", "5", "6"]
    @State private var isActive = false
    
    @State private var navActive = false
    var body: some View {
        
        
        NavigationView{
            ZStack{
                Color("Color").ignoresSafeArea()
                VStack{
                  
                    if isActive {
                        Categories()
                    }else{
                        AnimatedImage(imageNames: imageNames)
                        
                    }
                    
                }
                
            }.onAppear(){
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 9.5){
                    self.isActive = true
                    self.navActive = true
                    
                }
            }
            .toolbar{
                NavigationLink(destination: Categories().navigationBarBackButtonHidden(true)) {
                    Text("skip")
                        
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        .underline()
                    
                }
              
            }
            
            .navigationBarHidden(navActive)
        }.modifier(ResponsiveNavigationStyle())
    }
    
    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }
    
    
    struct AnimatedImage: View {
        
        
        @State var image: Image?
        let imageNames: [String]
        
        
   
        var body: some View {
           
            ZStack{
                Color("Color").ignoresSafeArea()
                VStack{
                
                    Group {
                        image?
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .onAppear(perform: {
                self.animate()
            })
            
        }
        
        
         func animate() {
            var imageIndex: Int = 0
            
            Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true) { timer in
                if imageIndex < self.imageNames.count {
                    self.image = Image(self.imageNames[imageIndex])
                    imageIndex += 1
                }
                else {
                    timer.invalidate()
                  
                }
            }
        }
    }
}
