//
//  SwiftUIView.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 18/06/1444 AH.
//

import UIKit
import SwiftUI



struct ParticelsView: View {
   
   
    var body: some View {
        
        ZStack{  
            ForEach(items) { item in
                EmitterItem(config: item)
                    .listRowBackground(Color(red: 0.1, green: 0.1, blue: 0.1))
            }
            
            Text("You won!🥳")
                .font(.title)
                .fontWeight(.bold)
                .frame(minWidth: 200, minHeight: 100)
                .background(.white)
                .cornerRadius(15.0)
            
        }.padding(.bottom, 400.0)
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

 
    
