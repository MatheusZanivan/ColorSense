//
//  File.swift
//  
//
//  Created by Matheus Zanivan on 16/04/23.
//

import SwiftUI

// MARK: View extension
extension View{
	func navigationStyle() -> some View{
		self
			.background(
				Image("backBg")
					.resizable()
					.scaledToFill()
			)
			.edgesIgnoringSafeArea(.all)
			.frame(minWidth: 0,maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
	}
}
