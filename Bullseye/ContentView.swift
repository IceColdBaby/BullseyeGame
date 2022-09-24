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
    
    struct LabelStyle: ViewModifier
    {
        func body(content: Content) -> some View
        {
            return content
                .foregroundColor(Color.white)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
        
        
    }
    
    struct ValueStyle: ViewModifier
    {
        func body(content: Content) -> some View
        {
            return content
                .foregroundColor(Color.yellow)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
        
        
    }
    
    struct ButtonLargeTextStyle: ViewModifier
    {
        func body(content: Content) -> some View
        {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    struct ButtonSmallTextStyle: ViewModifier
    {
        func body(content: Content) -> some View
        {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    
    struct Shadow: ViewModifier
    {
        func body(content: Content) -> some View
        {
            return content
                .shadow(color: Color.black,radius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, x:2, y:2)
        }
        
        
    }
    
    
    
    
    
    var body: some View
    {
        
       
        
        VStack
        {
            
            Spacer()
            
            HStack
            {
                Text("Put the bullseye as close as you can to:")
                    .modifier(LabelStyle())
                  
                
                Text("\(targetValue)").modifier(ValueStyle())
                
            }
            Spacer()
            
            HStack
            {
                Text("0").modifier(LabelStyle())
                    .padding(.leading, 30.0)
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
                    .padding(.trailing, 50)
                
            }
            Spacer()
            
            
            Button(action:
            {
            
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
            .background(Image("Button"), alignment: .center).modifier(ButtonLargeTextStyle())
            
            Spacer()
            
            HStack
            {
                
                
                Button(action:
                {
                   resetGame()
                    
                })
                {
                    
                    HStack
                    {
                        Image("StartOverIcon")
                        Text("Start Over").modifier(ButtonSmallTextStyle())
                        
                    }
                }
                .background(Image("Button")).modifier(Shadow())
                
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(Score)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(Round)").modifier(ValueStyle())
                            
            }.padding(.bottom, 20)
            
            
            
            
        }
        .background(Image("Background"), alignment: .center)
    
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

