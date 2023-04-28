//
//  SwiftUIView.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 18/06/1444 AH.
//

import UIKit
import SwiftUI



struct ParticelsView: View {
    
    @State private var isActive = false
    var body: some View {
        ZStack{
            VStack{
                if isActive {
                    Categories()
                        .navigationBarBackButtonHidden(true)
                                    }else{
                    Particels()
                }
            }.onAppear(){
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    self.isActive = true
                    
                }
                
            }
          
        }
}
    struct ParticelsView_Previews: PreviewProvider {
        static var previews: some View {
            ParticelsView()
        }
    }
    
    struct EmitterItem: View {
        var config: EmitterConfig
        
        var body: some View {
            VStack(alignment: .leading) {
                config.emitter
                    .emitterSize(config.size)
                    .emitterShape(config.shape)
                    .emitterPosition(config.position)
            }
            .padding(.trailing, 0)
            .padding(.bottom, 8)
            
        }
    }
    
    
    struct Particels: View {
        var body: some View {
            
            ZStack{
                
                ForEach(items) { item in
                    EmitterItem(config: item)
                        .listRowBackground(Color(red: 0.1, green: 0.1, blue: 0.1))
                }.padding(.bottom, 200.0).ignoresSafeArea()
                VStack{
                    Image("winnerCup")
                        .resizable()
                        .frame(width: 260.93, height: 314)
                    
                 
                        
                    
                }
            }
            
        }
    }
    
}
