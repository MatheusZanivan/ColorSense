//
//  SwiftUIView.swift
//  
//
//  Created by Matheus Zanivan on 17/04/23.
//

import SwiftUI
import AVKit

// MARK: SimulationView
struct SimulationView: View {
	
	@State var cameraAlert = true
	@State var previusPage = false
	
	@State var filter: CIFilter
	
	
	@State var deuteranopiaState = false
	@State var protanopiaState = false
	@State var tritanopiaState = false
	@State var nomalState = true
	
	let filters = CameraFilters()
	
	
	var body: some View {
		VStack{
			VStack(alignment: .leading, spacing: 0){
				Text("Color Sense")
					.font(.system(size: 20, weight: .semibold, design: .default))
					.foregroundColor(Color("appTittleColor"))
					.padding(.top, 50)
				GeometryReader{ geometry in
					CameraView(filter: $filter)
				}.padding(.top, 20)
				
				HStack(spacing: 25){
					CardButton(action: {
						deuteranopiaState = true
						protanopiaState = false
						tritanopiaState = false
						nomalState = false
						
						filter = filters.deuteranopia
					}, imageName: "deuteranopiaLogo", title: "Deuteranopia", text: "Green and red may appear closer to shades of gray or brown.", isActive: deuteranopiaState)
					
					CardButton(action: {
						deuteranopiaState = false
						protanopiaState = true
						tritanopiaState = false
						nomalState = false
						filter = filters.protanopia
					}, imageName: "protanopiaLogo", title: "Protanopia", text: "Red and green may appear closer to shades of gray or brown.", isActive: protanopiaState)
					CardButton(action: {
						deuteranopiaState = false
						protanopiaState = false
						tritanopiaState = true
						nomalState = false
						
						filter = filters.tritanopia
					}, imageName: "tritanopiaLogo", title: "Tritanopia", text: " Blue and yellow may appear closer to shades of gray or green.", isActive: tritanopiaState)
					
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
					nomalState = true
					deuteranopiaState = false
					protanopiaState = false
					tritanopiaState = false
					filter = filters.normal
				}, label: {
					if nomalState{
						Text("Default camera")
					}
					else{
						HStack(){
							Text("Reset Camera")
							Image(systemName: "arrow.triangle.2.circlepath")
						}
					}
					
				}).buttonStyle(NavButton(color: Color("butonColor"), sizeWidth: 200))
			}
			.padding(.leading, 20)
			.padding(.bottom, 20)
			Spacer()
			
		}
		.padding(.horizontal, 30)
		.navigationStyle()
		.overlay(previusPage ? ExplanetionView() : nil)
		.onAppear{
			filter = filters.normal
			AVCaptureDevice.requestAccess(for: .video){ isGranted in
				if isGranted == false{
					cameraAlert = false
				}
			}
		}
	}
}

