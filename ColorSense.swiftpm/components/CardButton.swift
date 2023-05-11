//
//  SwiftUIView.swift
//
//
//  Created by Matheus Zanivan on 17/04/23.
//

import SwiftUI

// MARK: CardButton 
struct CardButton: View {
	
	var action: () -> Void
	var imageName: String
	var title: String
	var text: String
	
	var isActive : Bool
	
	var body: some View {
		Button(action: action) {
			if isActive{
				VStack(alignment: .leading, spacing: 16) {
					HStack{
						Image(imageName)
							.clipped()
						
						Text(title)
							.font(.title)
							.fontWeight(.bold)
							.foregroundColor(Color("appTittleColor"))
					}
					Text(text)
						.font(.body)
						.foregroundColor(Color("appTittleColor"))
						.lineLimit(nil)
					
				}
				.padding()
				.background(Color("cardActiveColor"))
				.cornerRadius(10)
			}
			else{
				VStack(alignment: .leading, spacing: 16) {
					HStack{
						Image(imageName)
							.clipped()
						
						Text(title)
							.font(.title)
							.fontWeight(.bold)
							.foregroundColor(Color("appTittleColor"))
					}
					Text(text)
						.font(.body)
						.foregroundColor(Color("appTittleColor"))
						.lineLimit(nil)
					
				}
				.padding()
				.background(Color("cardColor"))
				.cornerRadius(10)
			}
			
			
		}
	}
}
