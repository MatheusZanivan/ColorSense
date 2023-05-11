//
//  SwiftUIView 2.swift
//  
//
//  Created by Matheus Zanivan on 16/04/23.
//

import SwiftUI


// MARK: CardView
struct CardView: View {
	
	var imageName: String
	var title: String
	var text: String
	
	var body: some View {
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


