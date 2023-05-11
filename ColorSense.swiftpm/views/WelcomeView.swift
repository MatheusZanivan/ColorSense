//
//  SwiftUIView.swift
//  
//
//  Created by Matheus Zanivan on 16/04/23.
//

import SwiftUI
import AVKit

// MARK: WelcomeView
struct WelcomeView: View {
	@State var nextPage = false
	
	let filters = CameraFilters()
	var body: some View {
		
		VStack(alignment: .leading){
			
			VStack(alignment: .leading, spacing: 0){
				VStack(alignment: .leading, spacing: 0){
					Text("Color Sense")
						.font(.system(size: 20, weight: .semibold, design: .default))
						.foregroundColor(Color("appTittleColor"))
						.padding(.top, 50)
					Image("appLogo")
						.padding(.top, 30)
					Text("Welcome!")
						.font(.system(size: 80,weight: .bold,design: .default))
						.foregroundColor(Color.white)
						.padding(.top, 1)
					
					Text("This is an app that allows you to experience the world from the perspective of someone who is colorblind.")
						.foregroundColor(Color.white)
						.fixedSize(horizontal: false, vertical: true)
						.clipped()
						.font(.system(size: 20, weight: .bold, design: .default))
						.padding(.top, 20)
					
					Text("Simply point your camera at something, and the app applies various filters to demonstrate what a person with color vision deficiency would see. This is an excellent way to raise awareness about the obstacles encountered by individuals with color vision deficiency and to promote the significance of accessibility.")
						.foregroundColor(Color("appTittleColor"))
						.fixedSize(horizontal: false, vertical: true)
						.clipped()
						.font(.system(size: 20, weight: .medium, design: .default))
						.padding(.top, 20)
					
				}
				.frame(width: 800, alignment: .leading)
			}
			HStack(alignment: .bottom, spacing: 0){
				
				Button("Let's Start"){
					withAnimation{
						nextPage = true
					}
				}
				.buttonStyle(NavButton(color: Color("butonColor"), sizeWidth: 150))
				Spacer()
			}
			Spacer()
		}
		.padding(.leading, 30)
		.navigationStyle()
		.overlay(nextPage ? SeeColorsView() : nil)
	}
}
