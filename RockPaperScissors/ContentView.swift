//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alvaro Valdes Salazar on 26-07-20.
//  Copyright © 2020 Alvaro Valdes Salazar. All rights reserved.
//

import SwiftUI



extension Image {
    func myImageModifier() -> some View {
        self
            .renderingMode(.original)
            .resizable()
            .frame(width: 80, height: 80)
   }
}


struct ContentView: View {
    private let allChoices = ["Rock", "Paper", "Scissors"]
    @State private var iaAnwser = Int.random(in: 0...2)
    @State private var userScore:Int = 0
    @State private var showingScore = false
    @State private var mensajito:String = ""
    @State private var contador:Int = 0

    private let titulo = """
Rock Paper Scissors \n The game
"""
    
    var body: some View {
        VStack {
            Text("\(titulo)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer()
            if contador != 0 {
            Text("The I.A. chose: \(allChoices[iaAnwser])")
                Image(allChoices[iaAnwser])
                    .myImageModifier()
            } else {
                Text("The I.A. haven't chose yet")

            }


            Spacer()
            Text(": \(mensajito)")


            Text("Your Score is: \(userScore)")

            Spacer()
            Text("Number of Games: \(contador)")

            HStack {

                ForEach (0..<3) { number in
                    Button(action: {
                            self.handTapped(number) // flag was tapped
                        self.contador += 1
                    }) {
                        Image(self.allChoices[number])
                        .myImageModifier()
                        
                    }
//            Spacer()

                }

            }
    
        }
    }
//        .alert(isPresented: $showingScore) {
//    //            I add Text("\(scoreMessage)" to a message:
//                Alert(title: Text(scoreTitle), message: Text("\(scoreMessage)"), dismissButton: .default(Text("Continue")) {
//                    self.askQuestion()
//                    })
//            }
//        }

    func handTapped(_ number: Int) {
        if number == 0 { // I CHOSE ROCK
            if iaAnwser==1 {
            userScore -= 1       // IA CHOSE PAPER, I LOSE
            mensajito = "You lose"
            iaAnwser = Int.random(in: 0...2)
            }
            if iaAnwser==2 {
            userScore += 1      // IA CHOSE SCISSOR, I WIN
            mensajito = "You win"
            iaAnwser = Int.random(in: 0...2)

            } else {
                mensajito = "It's a Tie"
                iaAnwser = Int.random(in: 0...2)
            }
        }
        if number == 1 { // I CHOSE PAPER
                
            if iaAnwser==0 {
            userScore += 1       // IA CHOSE ROCK, I WIN
            mensajito = "You win"
                iaAnwser = Int.random(in: 0...2)
            }
            if iaAnwser==2 {
            userScore -= 1      // IA CHOSE SCISSOR, I LOSE
            mensajito = "You lose"
                iaAnwser = Int.random(in: 0...2)
            } else {
                    mensajito = "It's a Tie"
                    iaAnwser = Int.random(in: 0...2)
            }
        }
    if number == 2 { // I CHOSE SCISSORS
            
 
        if iaAnwser==0 {
            userScore -= 1      // IA CHOSE SCISSOR, I LOSE
            mensajito = "You lose"
            iaAnwser = Int.random(in: 0...2)
        }
        if iaAnwser==1 {
            userScore += 1       // IA CHOSE ROCK, I WIN
            mensajito = "You win"
             iaAnwser = Int.random(in: 0...2)
         } else {
            mensajito = "It's a Tie"
            iaAnwser = Int.random(in: 0...2)
        }
    }
    }
    
//    func askQuestion() {
//        correctAnswer = Int.random(in: 0...2)
//    }
}



struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
ContentView()
   }
}
