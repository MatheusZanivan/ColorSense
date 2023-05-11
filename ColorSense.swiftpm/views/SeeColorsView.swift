//
//  SwiftUIView.swift
//
//
//  Created by Matheus Zanivan on 17/04/23.
//

import SwiftUI

// MARK: SeeColorsView
struct SeeColorsView: View {
	
	@State var nextPage = false
	@State var previusPage = false
	
	var body: some View {
		VStack{
			
			VStack(alignment: .leading, spacing: 0){
				ReusableView(pageTitle: "How do we see colors?", pageText: "White light is made up of all the colors in the visible spectrum. For example, when a wave of white light hits an apple, the apple reflects the color red, which we then see with our eyes. The cones in our eyes are activated to varying degrees by the incoming light, and in this case, the red cone is the most activated. The brain interprets the signals received from the cones to perceive the specific color of the object.", frameWidth: 900)
					.background(Group{
						EmptyView()
					})
				HStack(){
					Spacer()
					CardView(imageName: "howToSeeColorsRed", title: "", text: "")
					Spacer()
					
					//					Image("howToSeeColorsRed")
					//					Image("howToSeeColorsGreen")
				}
				.padding(.top, 10)
				
				
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
			.padding(.bottom, 20)
			
			Spacer()
			
		}.padding(.horizontal, 30)
			.navigationStyle()
			.overlay(nextPage ? ColorBlindView() : nil)
			.overlay(previusPage ? WelcomeView(): nil)
	}
}
