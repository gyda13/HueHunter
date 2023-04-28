//
//  Toy.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 16/06/1444 AH.
//


import SwiftUI

struct Object {
    let id: Int
    let color: Color
    var image: Image
    let colorname: String
 
}



extension Object {
    static let animals = [
        Object(id: 1, color: .red, image: Image("lobster"), colorname: NSLocalizedString("Red", comment: "")),
        Object(id: 2, color: .green, image: Image("lizerd"), colorname: NSLocalizedString("Green", comment: "")),
        Object(id: 3, color: .orange, image: Image("lion"), colorname: NSLocalizedString("Orange", comment: "")),
        Object(id: 4, color: .brown, image: Image("camel"), colorname: NSLocalizedString("Brown", comment: "")),
        Object(id: 5, color: .blue, image: Image("whale"), colorname: NSLocalizedString("Blue", comment: "")),
        Object(id: 6, color: .yellow, image: Image("chicks"), colorname: NSLocalizedString("Yellow", comment: "")),
        Object(id: 7, color: .white, image: Image("sheap"),colorname: NSLocalizedString("White", comment: "")),
        Object(id: 8, color: .purple, image: Image("octobots"), colorname: NSLocalizedString("Purple", comment: "")),
        Object(id: 9, color: .gray, image: Image("elaphent"), colorname: NSLocalizedString("Gray", comment: ""))
    ]
    
    static let sports = [
        Object(id: 1, color: .red, image: Image("boxing"), colorname: NSLocalizedString("Red", comment: "")),
        Object(id: 2, color: .green, image: Image("playground"), colorname: NSLocalizedString("Green", comment: "")),
        Object(id: 3, color: .orange, image: Image("basketball"), colorname: NSLocalizedString("Orange", comment: "")),
        Object(id: 4, color: .brown, image: Image("pigskinball"), colorname: NSLocalizedString("Brown", comment: "")),
        Object(id: 5, color: .blue, image: Image("racket"), colorname: NSLocalizedString("Blue", comment: "")),
        Object(id: 6, color: .yellow, image: Image("tennisball"), colorname: NSLocalizedString("Yellow", comment: "")),
        Object(id: 7, color: .white, image: Image("bowling"),colorname: NSLocalizedString("White", comment: "")),
        Object(id: 8, color: .purple, image: Image("billiardball"), colorname: NSLocalizedString("Purple", comment: "")),
        Object(id: 9, color: .gray, image: Image("dumbbell"), colorname: NSLocalizedString("Gray", comment: ""))
    ]
    
    static let FruitsandVegetables  = [
        Object(id: 1, color: .red, image: Image("apple"), colorname: NSLocalizedString("Red", comment: "")),
        Object(id: 2, color: .green, image: Image("cabbage"), colorname: NSLocalizedString("Green", comment: "")),
        Object(id: 3, color: .orange, image: Image("carrot"), colorname: NSLocalizedString("Orange", comment: "")),
        Object(id: 4, color: .brown, image: Image("potato"), colorname: NSLocalizedString("Brown", comment: "")),
        Object(id: 5, color: .blue, image: Image("blueberry"), colorname: NSLocalizedString("Blue", comment: "")),
        Object(id: 6, color: .yellow, image: Image("banana"), colorname: NSLocalizedString("Yellow", comment: "")),
        Object(id: 7, color: .white, image: Image("onion"),colorname: NSLocalizedString("White", comment: "")),
        Object(id: 8, color: .purple, image: Image("grape"), colorname: NSLocalizedString("Purple", comment: "")),
        Object(id: 9, color: .gray, image: Image("mushroom"), colorname: NSLocalizedString("Gray", comment: ""))
    ]
    
    static let nature = [
        Object(id: 1, color: .red, image: Image("redflower"), colorname: NSLocalizedString("Red", comment: "")),
        Object(id: 2, color: .green, image: Image("greenleav"), colorname: NSLocalizedString("Green", comment: "")),
        Object(id: 3, color: .orange, image: Image("orangeleav"), colorname: NSLocalizedString("Orange", comment: "")),
        Object(id: 4, color: .brown, image: Image("wood"), colorname: NSLocalizedString("Brown", comment: "")),
        Object(id: 5, color: .blue, image: Image("sea"), colorname: NSLocalizedString("Blue", comment: "")),
        Object(id: 6, color: .yellow, image: Image("sun"), colorname: NSLocalizedString("Yellow", comment: "")),
        Object(id: 7, color: .white, image: Image("cloud"),colorname: NSLocalizedString("White", comment: "")),
        Object(id: 8, color: .purple, image: Image("purpleflower"), colorname: NSLocalizedString("Purple", comment: "")),
        Object(id: 9, color: .gray, image: Image("rock"), colorname: NSLocalizedString("Gray", comment: ""))
    ]
    
    
}



