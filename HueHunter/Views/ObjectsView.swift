//
//  ToyView.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 16/06/1444 AH.
//

import SwiftUI
import AVFoundation

struct ObjectsView: View {
    
    

    
    @StateObject private var viewModel = GameViewModel()
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
  
   var navTitle: String?

    
   
    var category: Int = 0


    func Title() -> String {
        var title: String?
        if viewModel.attempts  == 0 {
        title = NSLocalizedString("Let's Start!", comment: "")
        }
        
        if viewModel.attempts  == 1 {
        title  = NSLocalizedString("...🤔", comment: "")
           
        }
        
        if viewModel.attempts  == 2 {
        title  = NSLocalizedString("Wonderful!🤩", comment: "")
        }
        
        if viewModel.attempts  == 3 {
        title  = NSLocalizedString("Keep Going!👏🏻", comment: "")
        }
        
        if viewModel.attempts  == 4 {
        title = NSLocalizedString("Well done!", comment: "")
        }
        
        if viewModel.attempts  == 5 {
        title = NSLocalizedString("Great!🤩", comment: "")

        }
        
        if viewModel.attempts  == 6 {
        title = NSLocalizedString("👏🏻👏🏻", comment: "")
        }
        
        if viewModel.attempts  == 7 {
        title = NSLocalizedString("You're Close!", comment: "")
        }
        
        if viewModel.attempts  == 8 {
        title = NSLocalizedString("One more left!", comment: "")
        }
        
        if viewModel.attempts  == 9 {
        title = NSLocalizedString("You Did it!!🥳", comment: "")
            SoundManager.instance.playSoundWin()
        }
        return title ?? ""
    }

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
            Color("backgroundColor").ignoresSafeArea()
          
                ZStack{
                    VStack{
               
                        Text(Title())
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("AccentColor"))
                    }.padding(.bottom, 600.0)

                    
                    
                    LazyVGrid(columns: gridItems) {
                        if self.category == 0 {
                            
                            ForEach(viewModel.animalsContainers, id: \.id) { object in
                                ObjectContainer(
                                    object: object,
                                    viewModel: viewModel
                                )
                            }
                        }
                        if self.category == 1 {
                            
                            ForEach(viewModel.natureContainers, id: \.id) { object in
                                ObjectContainer(
                                    object: object,
                                    viewModel: viewModel
                                )
                            }
                            
                        }
                        if self.category == 2 {
                            ForEach(viewModel.FruitsandVegetablesContainers, id: \.id) { object in
                                ObjectContainer(
                                    object: object,
                                    viewModel: viewModel
                                )
                            }
                        }
                        if self.category == 3 {
                            ForEach(viewModel.sportsContainers, id: \.id) { object in
                                ObjectContainer(
                                    object: object,
                                    viewModel: viewModel
                                )
                            }
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
                    ParticelsView().navigationBarHidden(true)
                }
            
           
                
            
        }
        .onAppear {
            viewModel.setNextToy()
            
        }
    
        .toolbar{
         
            HStack{
                Image("star")
                Text(NSLocalizedString("\(viewModel.attempts)/9", comment: ""))
                
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("starColor"))
            }.padding(.leading, 200.0 )
               
        }
        
       
    }
       
}


    
    

    struct ObjectView_Previews: PreviewProvider {
        static var previews: some View {
            ObjectsView()

        }
    }



