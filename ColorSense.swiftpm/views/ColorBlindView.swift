//
//  SwiftUIView.swift
//  
//
//  Created by Matheus Zanivan on 16/04/23.
//

import SwiftUI

// MARK: ColorBlindView
struct ColorBlindView: View {
	
	@State var previusPage = false
	@State var nextPage = false
	
	var body: some View {
		VStack{
			VStack(alignment: .leading, spacing: 0){
				ReusableView(pageTitle: "Color blindness", pageText: "Color blindness is a condition that affects a person's ability to differentiate between certain colors due to a problem with the color-sensing pigments in the cone cells of the eye. According to Covisin-Color blindness experts, there are over 300 million people worldwide who struggle to see the world in color. ", frameWidth: 850)
					.background(Group{
						EmptyView()
					})
				Text("These are the three main types of color blindness:")
					.foregroundColor(Color("appTittleColor"))
					.frame(width: 850, alignment: .leading)
					.fixedSize(horizontal: false, vertical: true)
					.clipped()
					.font(.system(size: 20, weight: .medium, design: .default))
					.padding(.top, 5)
				HStack(spacing: 25){
					CardView(imageName: "deuteranopiaLogo", title: "Deuteranopia", text: "The green-sensitive cones are absent,making difficulty distinguishing between the colors green and red.")
					CardView(imageName: "protanopiaLogo", title: "Protanopia", text: "The red-sensitive cones are absent,making difficulty distinguishing between the colors red and green.")
					CardView(imageName: "tritanopiaLogo", title: "Tritanopia", text: "The blue-sensitive cones are absent, making difficulty distinguishing between the colors blue and yellow" )
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
			.overlay(nextPage ? ExplanetionView() : nil)
			.overlay(previusPage ? SeeColorsView() : nil)
	}
}
