//
//  HomeView.swift
//  Watch
//
//  Created by Rostislav Brož on 1/4/22.
//

import SwiftUI


// declaration of a constant from which screen width and height is accessed to properly position and size objects

let screenSize: CGRect = UIScreen.main.bounds


//

public var white = Color(red: 1, green: 1, blue: 1)
public var black = Color(red: 0.004, green: 0, blue: 0)
public var gray1 = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
public var gray2 = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
public var gray3 = Color(red: 0.1333, green: 0.1333, blue: 0.1373)


struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    @State var showingMapView:Bool = true
    
    var body: some View {
        if model.authorizationState == .notDetermined {
            OnBoardingView()
        }
        
        else if model.authorizationState == .authorizedWhenInUse || model.authorizationState == .authorizedAlways {
            if showingMapView == true {
                ZStack {
                    MapView()
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: screenSize.width / 1.8, height: screenSize.width / 7)
                                .cornerRadius(15)
                            
                            Text("Search the globe")
                        }
                        
                        Button(action:  {showingMapView.toggle()},
                                label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(gray3)
                                            .frame(width: screenSize.width / 7, height: screenSize.width / 7)
                                                    .cornerRadius(15)
                                        
                                        Image(systemName: "gear")
                                            .resizable()
                                            .foregroundColor(white)
                                            .frame(width: screenSize.width / 13, height: screenSize.width / 13)
                                    }
                        })
                    }
                }
            }
            
            else {
                VStack {
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: screenSize.width / 1.8, height: screenSize.width / 7)
                                .cornerRadius(15)
                            
                            Text("Search the globe")
                        }
                        
                        Button(action:  {showingMapView.toggle()},
                                label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(gray3)
                                            .frame(width: screenSize.width / 7, height: screenSize.width / 7)
                                                    .cornerRadius(15)
                                        
                                        Image(systemName: "gear")
                                            .resizable()
                                            .foregroundColor(white)
                                            .frame(width: screenSize.width / 13, height: screenSize.width / 13)
                                    }
                        })
                    }
                    
                    Divider()
                    
                    MenuSheetView()
                }
            }
        }
        
        else if model.authorizationState == .denied {
            DeniedView()
        }
        
        else {
            Text("Sorry, something went wrong. WW can't determine the location authorization status. Try setting it to When In Use in iOS settings and reopening the app!")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
