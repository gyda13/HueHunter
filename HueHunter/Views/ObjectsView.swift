//
//  ToyView.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 16/06/1444 AH.
//

import SwiftUI

struct  ObjectsView: View {
    @StateObject private var viewModel = GameViewModel()
    @State var showAlert = false
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                viewModel.update(dragPosition: state.location)
            }
            .onEnded { state in
                viewModel.update(dragPosition: state.location)
                withAnimation {
                    viewModel.confirmWhereToyWasDropped()
                }
            }
    }
    
    var body: some View {
        
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
           
            ZStack{
               
                VStack{
                   
                    Text("Drag the color below and drop it into the object that matches this color")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                    HStack{
                        Text(NSLocalizedString("score:", comment: ""))
                            .font(.title2)
                            .bold()
                        
                        Text("\(viewModel.attempts)")
                            .font(.title2)
                            .foregroundColor(Color.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                       
                        
                    }.padding(8)
                    Spacer()
                    
                   
                }.padding(30)
                
               
                LazyVGrid(columns: gridItems, spacing: 40) {
                    
                    ForEach(viewModel.toyContainers, id: \.id) { object in
                        ObjectContainer(
                            object: object,
                            viewModel: viewModel
                        )
                        
                    }
                    
                }.padding()
                
                if let currentObject = viewModel.currentToy {
                    
                    DraggableColor(
                        color: currentObject,
                        position: viewModel.currentPosition,
                        gesture: drag
                        
                    )
                    .opacity(viewModel.draggableToyOpacity)
                }
            }
            if (viewModel.attempts == 9) {
                SwiftUIView()
            }else{
               
            }
        }
        .onAppear {
            viewModel.setNextToy()
            showAlert = true      
        }
        .alert(
           
            Text(NSLocalizedString("lets play again", comment: "")),
            isPresented: $viewModel.isGameOver,
         
            actions: {
                Button("OK") {
                    withAnimation {
                        viewModel.generateNewGame()
                    }
                    
                }
             
                
                
            },
            message: {
              
            }
                
        )
        .alert(isPresented: $showAlert) {
            
                            Alert(title: Text("Welecom to Hue Hunter where you can classifay colors with objects ..🤩 \n If you have vision disabilities please enbel the image descriptions in the VoiceOver seetings. \n Seetings > Accessibility > VoiceOver > VoiceOver recognition > image descriptions - on -"))
                        }
        }
        
    }
    
    struct ObjectView_Previews: PreviewProvider {
        static var previews: some View {
            ObjectsView()
        }
    }

