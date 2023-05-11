//
//  File.swift
//  
//
//  Created by Matheus Zanivan on 19/04/23.
//

import SwiftUI

// MARK: CardViewSymbos
struct CardViewSymbols: View {
	
	var imageName: String
	var title: String
	var text: String
	
	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			HStack{
				Image(systemName: imageName	)
					.clipped()
					.foregroundColor(.white)
				
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


