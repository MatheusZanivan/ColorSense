//
//  SwiftUIView.swift
//  
//
//  Created by Matheus Zanivan on 16/04/23.
//

import SwiftUI

// MARK: ReusableView
struct ReusableView: View {
	var pageTitle : String
	
	var pageText : String
	
	var frameWidth : CGFloat
	
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0){
			Text("Color Sense")
				.font(.system(size: 20, weight: .semibold, design: .default))
				.foregroundColor(Color("appTittleColor"))
				.padding(.top, 50)
			Image("appLogo")
				.padding(.top, 30)
			
			Text(pageTitle)
				.font(.system(size: 80,weight: .bold,design: .default))
				.foregroundColor(Color.white)
				.padding(.top, 20)
			Text(pageText)
				.foregroundColor(Color("appTittleColor"))
				.frame(width: frameWidth, alignment: .leading)
				.fixedSize(horizontal: false, vertical: true)
				.clipped()
				.font(.system(size: 20, weight: .medium, design: .default))
				.padding(.top, 20)
			
		}
	}
}

