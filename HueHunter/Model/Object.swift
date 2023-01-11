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
    let image: Image
    let colorname: String
}

extension Object {
    static let all = [
        Object(id: 1, color: .red, image: Image("apple"), colorname: NSLocalizedString("Red", comment: "")),
        Object(id: 2, color: .green, image: Image("plant"), colorname: NSLocalizedString("Green", comment: "")),
        Object(id: 3, color: .orange, image: Image("carrot"), colorname: NSLocalizedString("Orange", comment: "")),
        Object(id: 4, color: .brown, image: Image("wood"), colorname: NSLocalizedString("Brown", comment: "")),
        Object(id: 5, color: .blue, image: Image("sea"), colorname: NSLocalizedString("Blue", comment: "")),
        Object(id: 6, color: .yellow, image: Image("banana"), colorname: NSLocalizedString("Yellow", comment: "")),
        Object(id: 7, color: .white, image: Image("sheap"),colorname: NSLocalizedString("White", comment: "")),
        Object(id: 8, color: .purple, image: Image("grape"), colorname: NSLocalizedString("Purple", comment: "")),
        Object(id: 9, color: .gray, image: Image("elaphent"), colorname: NSLocalizedString("Gray", comment: ""))
    ]
}
