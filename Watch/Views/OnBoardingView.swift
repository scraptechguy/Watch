//
//  OnBoardingView.swift
//  Watch
//
//  Created by Rostislav Brož on 1/4/22.
//

import SwiftUI

struct OnBoardingView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        Button(action: {model.requestGeolocationPermission()},
               label: {
                    Text("Request location permition")
                        .foregroundColor(Color.black)
        })
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
