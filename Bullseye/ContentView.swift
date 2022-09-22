//
//  ContentView.swift
//  Bullseye
//
//  Created by Giannis Mouratidis on 22/9/22.
//

import SwiftUI

struct ContentView: View
{
    @State var alertIsVisible = false
    @State var sliderValue  = 50.0
    @State var targetValue  = Int.random(in: 1...100)
    @State var Score = 0
    @State var Round = 1
    
    var body: some View
    {
        
        VStack
        {
            Spacer()
            HStack
            {
                Text("Put the bullseye as close as you can to:")
                Text("\(targetValue)")
            }
            Spacer()
            
            HStack
            {
                Text("0")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
                
            }
            Spacer()
            
            
            Button(action:
                    {
                print("Button Pressed")
                alertIsVisible = true
                
            })
            {
                Text("Hit Me")
            }
            
            .alert(isPresented: $alertIsVisible)
            { () ->
                Alert in
                //var roundedValue: Int = Int(sliderValue.rounded())
                return Alert(title: Text("\(alertTitle())"), message: Text("The slider's value is  \(sliderValueRounded())"+"you scored \(pointsForCurrentRound())"),
                             dismissButton: .default(Text("Awesome!!!")) {Score=Score+pointsForCurrentRound()
                        Round+=1
                    targetValue  = Int.random(in: 1...100) } )
                
            }
            Spacer()
            
            HStack
            {
                
                Button("Start Over") {
                    resetGame()
                }
                Spacer()
                Text("Score:")
                Text("Your score is \(Score)")
                Spacer()
                Text("Round:")
                Text("\(Round)")
                Spacer()
                Button("Info") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                
                
            }.padding(.bottom, 20)
            
            
            
            
        }
        
        
    }
    
    func amountOff() ->Int
    {
        return abs(targetValue-sliderValueRounded())
    }
    
    func sliderValueRounded() ->Int
    {
        return Int(sliderValue.rounded())
    }
    
    
    func pointsForCurrentRound() -> Int
    {
      
        if amountOff() == 0
        {
            return 200
        }
        else if amountOff() == 1
        {
            return 150
        }
        else
        {
            return 100-amountOff()
        }
        
    }
    
    func resetGame()
    {
        Score=0
        Round=1
        sliderValue=50.0
        targetValue=Int.random(in: 1...100)
    }
    
    
    func alertTitle() -> String
    {
        let difference = amountOff()
        let title: String
        if difference == 0
        {
            title = "Bullseye!!!"
        }
        else if difference < 10
        {
            title = "You almost had it !"
        }
        else if difference < 25
        {
            title = "Not bad."
        }
        else
        {
            title = "Are you even trying ? "
        }
        return title
        }
        
        
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(PreviewLayout.fixed(width: 896, height: 414))
    }
}
