//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alvaro Valdes Salazar on 26-07-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let allChoices = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var iaAnwser = Int.random(in: 0...2)
    @State private var userScore:Int = 0
    @State private var showingScore = false

    
    
    
    var body: some View {
        VStack {
            Text("Your Score is: \(userScore)")
            Spacer()
            HStack {
                ForEach (0..<3) { number in
                    Button(action: {
                            self.handTapped(number) // flag was tapped
                    }) {
                        Image(self.allChoices[number])
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 80, height: 80)
                        
                    }
//            Spacer()

                }

            }
            Spacer()
    
        }
    }
    func handTapped(_ number: Int) {
        if number == 0 { // I CHOSE ROCK
            if iaAnwser==1 {
//            case 1: // IA CHOSE PAPER, I LOSE
            userScore -= 1
            }
            if iaAnwser==2 {
//            case 2: // IA CHOSE SCISSOR, I WIN
            userScore += 1
            }
//            default: // IA CHOSE ROCK, WE TIE
//                showingScore = true
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
