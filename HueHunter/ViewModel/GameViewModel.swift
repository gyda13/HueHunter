//
//  ToyViewModel.swift
//  HueHunter
//
//  Created by gyda almohaimeed on 16/06/1444 AH.
//

import SwiftUI
import AVFoundation
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSoundMatch() {
        
        guard let url = Bundle.main.url(forResource: "match", withExtension: ".wav") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("error play sound")
        }
    }
    func playSoundFail() {
        
        guard let url = Bundle.main.url(forResource: "fail", withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("error play sound")
        }
    }
    func playSoundWin() {
        
        guard let url = Bundle.main.url(forResource: "win", withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("error play sound")
        }
    }
}

class GameViewModel: Identifiable, ObservableObject {
    // MARK: - Gesture Properties
    @Published var currentToy: Object?
    @Published var currentPosition = initialPosition
    @Published var highlightedId: Int?
    @Published var draggableToyOpacity: CGFloat = 1.0
    @Published var isGameOver = false
    private(set) var attempts = 0
    @Published var object: Object?
    
    @Published var index =  3
    
    // MARK: - Coordinates
    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX ,
        y: UIScreen.main.bounds.maxY - 170
    )
    private var frames: [Int: CGRect] = [:]
    
    // MARK: - Objects in the screen
    
    
    private var animals = Array(Object.animals.shuffled().prefix(upTo: 9))
    var animalsContainers = Object.animals.shuffled()
    
    
    private var sports = Array(Object.sports.shuffled().prefix(upTo: 9))
    var sportsContainers = Object.sports.shuffled()
    
    private var FruitsandVegetables = Array(Object.animals.shuffled().prefix(upTo: 9))
    var FruitsandVegetablesContainers = Object.FruitsandVegetables.shuffled()
    
    
    private var nature = Array(Object.sports.shuffled().prefix(upTo: 9))
    var natureContainers = Object.nature.shuffled()
    
    

    // MARK: - Game lifecycle
    func confirmWhereToyWasDropped() {
        defer { highlightedId = nil }
        
        guard let highlightedId = highlightedId else {
            resetPosition()
            return
        }
        
        if highlightedId == currentToy?.id {
            setCurrentPositionToHighlightedContainer(WithId: highlightedId)
            generateNextRound()
            attempts += 1
            SoundManager.instance.playSoundMatch()
        } else {
            SoundManager.instance.playSoundFail()
            resetPosition()
        }
        
      
    }
    
    func resetPosition() {
        currentPosition = GameViewModel.initialPosition
    }
    
    func setCurrentPositionToHighlightedContainer(WithId id: Int) {
        guard let frame = frames[id] else {
            return
        }
        currentPosition = CGPoint(x: frame.midX, y: frame.midY) 
        makeToyInvisible()
    }
    
    func makeToyInvisible() {
        draggableToyOpacity = 0
    }
    
    func generateNextRound() {
        setNextToy()
        
        if currentToy == nil {
            gameOver()
        } else {
            prepareObjects()
        }
    }
    
    func setNextToy() {
            currentToy = animals.popLast()
        
            currentToy = sports.popLast()
       
            currentToy = FruitsandVegetables.popLast()
      
            currentToy = nature.popLast()
       
    }
    
    func gameOver() {
        isGameOver = true
       
    }
    
    func prepareObjects() {
        shuffleToyContainersWithAnimation()
        resetCurrentToyWithoutAnimation()
    }
    
    func shuffleToyContainersWithAnimation() {

            withAnimation {
                animalsContainers.shuffle()
     
                sportsContainers.shuffle()
      
           
                FruitsandVegetablesContainers.shuffle()
      
                natureContainers.shuffle()
            
        }
    }
    
    func resetCurrentToyWithoutAnimation() {
        withAnimation(.none) {
            resetPosition()
            restoreOpacityWithAnimation()
        }
    }
    
    func restoreOpacityWithAnimation() {
        withAnimation {
            draggableToyOpacity = 1.0
        }
    }
    
    func generateNewGame() {
        if(index == 0) {
           animals = Array(Object.animals.shuffled().prefix(upTo: 9))
            attempts = 0
            generateNextRound()
        }
        if(index == 1) {
            sports = Array(Object.nature.shuffled().prefix(upTo: 9))
            attempts = 0
            generateNextRound()
        }
        
        if(index == 2) {
            animals = Array(Object.FruitsandVegetables.shuffled().prefix(upTo: 9))
            attempts = 0
            generateNextRound()
        }
        if(index == 3) {
           sports = Array(Object.sports.shuffled().prefix(upTo: 9))
            attempts = 0
            generateNextRound()
        }
        
       
        
      
    }
    
    // MARK: - Updates in the screen
    func update(frame: CGRect, for id: Int) {
        frames[id] = frame
    }
    
    func update(dragPosition: CGPoint) {
        currentPosition = dragPosition
        for (id, frame) in frames where frame.contains(dragPosition) {
            highlightedId = id
            return
        }
        
        highlightedId = nil
    }
    
    func isHighlighted(id: Int) -> Bool {
        highlightedId == id
    }
}
