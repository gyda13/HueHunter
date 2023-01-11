//
//  Emmiter.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 18/06/1444 AH.
//

import Foundation
import SwiftUI



struct Constants {
    static let height: CGFloat = 230.0
    static let width: CGFloat = UIScreen.main.bounds.width
}

struct EmitterConfig: Identifiable {
    let emitter: ParticlesEmitter
    let size: CGSize
    let shape: CAEmitterLayerEmitterShape
    let position: CGPoint
    // To make the ForEach work
    let id = UUID()
}

