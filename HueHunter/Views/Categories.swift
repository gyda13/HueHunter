//
//  Categories.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 09/07/1444 AH.
//
import SwiftUI

struct Categories: View {
   
 
    
    let categories = ["animals", "nature", "FruitsandVegetables", "sports"]
    
    let categoriesName = [ NSLocalizedString("Animals", comment: ""),  NSLocalizedString("Nature", comment: ""), NSLocalizedString("Fruits and Vegetables", comment: ""), NSLocalizedString("Sports", comment: "")]
    
    var gridItems: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    
    var body: some View {
        
        
      NavigationView {

            ZStack {
                Color("backgroundColor").ignoresSafeArea()
                
                LazyVGrid(columns: gridItems) {
                    ForEach(categories.indices, id: \.self) { index in
                        
                        NavigationLink(destination: ObjectsView(category: index)
                            .navigationBarTitle("", displayMode: .inline)
                               
                        )
                        {
                            ZStack{
                                Image(categories[index])
                                    .resizable()
                                    .frame(width: 150, height: 270)
                                    .padding([.top, .leading, .trailing], 12.0)
                             
                                if(categoriesName[index] == "Fruits and Vegetables"){
                                    Text(categoriesName[index])
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.top, 98.0)
                                   
                                }
                                else{
                                    
                                    Text(categoriesName[index])
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.top, 130.0)
                                }
                            }
                              
                      }
                      
                    }
                    
                }
                
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                
                .toolbar {
                    ToolbarItemGroup(placement: .principal) {
                        Text("Hue Hunter")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("AccentColor"))
                            .padding(.top, 90.0)
                    }
                  
                }
               
          
            }
          
      }.modifier(ResponsiveNavigationStyle())
            
   }
}

                                       
struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
