//
//  AboutView.swift
//  Bullseye
//
//  Created by Giannis Mouratidis on 23/9/22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        
        VStack{
            Text("🎯 Bullseye 🎯")
            Text("This is Bullseye, the game where you can win points and earn fame by dragging the slider.")
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score !")
            Text("Enjoy!")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(PreviewLayout.fixed(width: 896, height: 414))
    }
}

