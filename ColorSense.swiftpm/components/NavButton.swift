//
//  File.swift
//  
//
//  Created by Matheus Zanivan on 16/04/23.
//

import SwiftUI

// MARK: NavButton
struct NavButton: ButtonStyle{
	
	var color: Color
	var sizeWidth : CGFloat
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(width: 200,height: 60, alignment: .center)
			.background(RoundedRectangle(cornerRadius: 47,style: .continuous)
				.fill(color)
				.frame(width: sizeWidth,height: 50)
				.clipped(), alignment: .center
			)
			.font(.system(size: 20, weight: .bold, design: .default))
			.foregroundColor(.white)
	}
}
