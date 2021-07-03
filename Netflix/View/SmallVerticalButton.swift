//
//  SmallVerticalButton.swift
//  Netflix
//
//  Created by ********* on 31/05/2020.
//

import SwiftUI

struct SmallVerticalButton: View {
    @State var show : Bool = false
    @Namespace var namespace
    var body: some View {
        Button(action: {
            withAnimation {
                show.toggle()
            }
            
        }, label: {
            VStack {
                Group {
                    Image(systemName: show ? "plus" : "checkmark").imageScale(.large)
                            .rotationEffect(Angle(degrees: show ? 0:360))
                   
                    Text("My List").bold()
                }.foregroundColor(.white)
                
            }
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallVerticalButton()
    }
}
