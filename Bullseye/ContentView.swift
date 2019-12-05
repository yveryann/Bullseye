//
//  ContentView.swift
//  Bullseye
//
//  Created by Yann Yver on 30/11/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alerteIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            
            //Target row
            HStack {
                Text("Put the Bullseye as close as you can to:")
                Text("\(self.target)")
                   
            }
            Spacer()
            
            //Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text(/*@START_MENU_TOKEN@*/"100"/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            
            //Button row
            Button(action: {
                print("Button pressed!")
                self.alerteIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alerteIsVisible) { () -> Alert in
                //let roundedValue = Int(sliderValue.rounded())
                return Alert(title: Text("Hello There !"), message: Text(
                    "The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound()) points this round"
                ), dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            
            //Score row
            HStack {
                Button(action: {}) {
                  Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}) {
                  Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    
    }
    
    func pointsForCurrentRound() -> Int {
        100 - abs(target - sliderValueRounded())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
