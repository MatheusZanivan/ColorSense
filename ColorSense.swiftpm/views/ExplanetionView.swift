//
//  SwiftUIView.swift
//  
//
//  Created by Matheus Zanivan on 17/04/23.
//

import SwiftUI

// MARK: ExplanetionView
struct ExplanetionView: View {
	
	@State var nextPage = false
	@State var previusPage = false
	
	var body: some View {
		VStack{
			VStack(alignment: .leading, spacing: 0){
				ReusableView(pageTitle: "It’s your turn!", pageText: "It's time to experience how individuals with color blindness perceive the world around them with ColorSense. By utilizing your camera, ColorSense offers an accurate simulation with three different types of filters. ", frameWidth: 800)
					.background(Group{
						EmptyView()
					})
				Text("Follow these steps to dive into the experience")
					.foregroundColor(Color("appTittleColor"))
					.frame(width: 850, alignment: .leading)
					.fixedSize(horizontal: false, vertical: true)
					.clipped()
					.font(.system(size: 20, weight: .medium, design: .default))
					.padding(.top, 5)
				HStack(spacing: 25){
					CardViewSymbols(imageName: "camera", title: "Authorize the camera", text: "This app needs the camera to apply color blindness filters")
					CardViewSymbols(imageName: "photo", title: "Point the camera", text: "Choose something around you to see how it looks with the selected filter")
					CardViewSymbols(imageName: "camera.filters", title: "Choose a filter", text: "Choose one of the 3 filters to start the experience")
				}
				.padding(.top, 20)
			}
			
			Spacer()
			
			HStack(alignment: .bottom, spacing: 0){
				Button(action: {
					withAnimation{
						previusPage = true
					}
				}, label: {
					HStack(){
						Image(systemName: "arrow.backward")
						Text("Previous")
					}
				})
				.buttonStyle(NavButton(color: Color("butonColor"), sizeWidth: 150))
				Spacer()
				Button(action: {
					withAnimation{
						nextPage = true
					}
				}, label: {
					HStack(){
						Text("Next")
						Image(systemName: "arrow.forward")
					}
				})
				.buttonStyle(NavButton(color: Color("butonColor"), sizeWidth: 150))
			}
			.padding(.leading, 20)
			.padding(.bottom, 20)
			
			Spacer()
			
		}.padding(.horizontal, 30)
			.navigationStyle()
			.overlay(nextPage ? SimulationView(filter: CameraFilters().normal ) : nil)
			.overlay(previusPage ? ColorBlindView() : nil)
	}
}

