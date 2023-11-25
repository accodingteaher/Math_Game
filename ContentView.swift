//
//  ContentView.swift
//  Math Game
//
//  Created by Nongluck Seenilthae on 25/11/2566 BE.
//

import SwiftUI

struct ContentView: View 
{
    @State private var number1 = Int.random(in:1...10)
    @State private var number2 = Int.random(in:1...10)
    @State private var userAnswer : String = ""
    @State private var score : Int = 0
    @State private var showGameOverAlert : Bool = false
    @State private var total : Int = 0
    var correctAnswer : Int
    {
        return number1 * number2
    }
    var body: some View
    {
        VStack(spacing: 20)//ระยะห่างระหว่างบรรทัด
        {
            Text("Score : \(score) / \(total)") //  \(   )แสดงตัวแปรใน Text เพื่อแปลงค่าตัวแปรจาก int เป็น string
                .font(.headline)
            Text("Guess the answer : ")
            Text("\(number1) * \(number2) = ?")
                .font(.largeTitle)
                .fontWeight(.semibold)
            TextField("Your Answer", text : $userAnswer)  //$ มีไว้เพื่อ ตัวแปรนี้ เป็น Binding  เพื่อไปแก้ไขค่าที่ประกาศใน private var userAnswer
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            Button("Check Answer")
            {
                if let userInt = Int(userAnswer), userInt == correctAnswer
                {
                    score += 1
                    nextProblem()
                }
                else
                {
                    showGameOverAlert = true
                }
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .padding()
        .alert(isPresented : $showGameOverAlert, content :{
            Alert(
                title: Text("Game Over"),
                message: Text("Your Total Score is \(score). Do you want to play Again?"),
                primaryButton: .default(Text("Yes"), action : startNewGame),
                secondaryButton : .cancel(Text("No")))
        })
    }
    func nextProblem()
    {
        number1 = Int.random(in:1...10)
        number2 = Int.random(in:1...10)
        userAnswer = ""
    }
    func startNewGame()
    {
        score = 0
        total = 0
        nextProblem()
    }
}

#Preview {
    ContentView()
}
