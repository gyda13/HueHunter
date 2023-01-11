//
//  SwiftUIView.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 18/06/1444 AH.
//

import UIKit
import SwiftUI



struct ParticelsView: View {
   
    var items: [EmitterConfig] = [
        EmitterConfig(emitter: Emitters.red,
                      size: CGSize(width: Constants.width, height: 1),
                      shape: .line,
                      position: CGPoint(x: Constants.width / 2, y: 0)),
        EmitterConfig(emitter: Emitters.green,
                      size: CGSize(width: Constants.width, height: 1),
                      shape: .line,
                      position: CGPoint(x: Constants.width / 4, y: 10)),
        EmitterConfig(emitter: Emitters.blue,
                      size: CGSize(width: Constants.width, height: 1),
                      shape: .line,
                      position: CGPoint(x: Constants.width / 6, y: 20)),
        EmitterConfig(emitter: Emitters.yellow,
                      size: CGSize(width: Constants.width, height: 1),
                      shape: .line,
                      position: CGPoint(x: Constants.width / 8, y: 30)),
        EmitterConfig(emitter: Emitters.orange,
                      size: CGSize(width: Constants.width, height: 1),
                      shape: .line,
                      position: CGPoint(x: Constants.width / 10, y: 40)),
    ]
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

 
    
