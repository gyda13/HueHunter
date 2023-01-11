//
//  Emmiter.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 18/06/1444 AH.
//

import Foundation
import SwiftUI

struct Emitters {
    static let red = ParticlesEmitter {
        EmitterCell()
            .content(.circle(8.0))
            .color(.red)
            .lifetime(10)
            .birthRate(30)
            .scale(0.1)
            .scaleRange(0.08)
            .velocity(100)
            .velocityRange(50)
            .yAcceleration(200.0)
            .emissionLongitude(.pi)
    }
    
    static let blue = ParticlesEmitter {
        EmitterCell()
            .content(.circle(8.0))
            .color(.blue)
            .lifetime(10)
            .birthRate(30)
            .scale(0.1)
            .scaleRange(0.08)
            .velocity(100)
            .velocityRange(50)
            .yAcceleration(200.0)
            .emissionLongitude(.pi)
    }
    
    static let green = ParticlesEmitter {
        EmitterCell()
            .content(.circle(8.0))
            .color(.green)
            .lifetime(10)
            .birthRate(30)
            .scale(0.1)
            .scaleRange(0.08)
            .velocity(100)
            .velocityRange(50)
            .yAcceleration(200.0)
            .emissionLongitude(.pi)
    }
    static let yellow = ParticlesEmitter {
        EmitterCell()
            .content(.circle(8.0))
            .color(.yellow)
            .lifetime(10)
            .birthRate(30)
            .scale(0.1)
            .scaleRange(0.08)
            .velocity(100)
            .velocityRange(50)
            .yAcceleration(200.0)
            .emissionLongitude(.pi)
    }
    static let orange = ParticlesEmitter {
        EmitterCell()
            .content(.circle(8.0))
            .color(.orange)
            .lifetime(10)
            .birthRate(30)
            .scale(0.1)
            .scaleRange(0.08)
            .velocity(100)
            .velocityRange(20)
            .yAcceleration(200.0)
            .emissionLongitude(.pi)
    }
}

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
