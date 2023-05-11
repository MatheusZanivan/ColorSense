//
//  File.swift
//  
//
//  Created by Matheus Zanivan on 17/04/23.
//

import Foundation
import CoreImage

// MARK: CIFilter extension
extension CIFilter{
	func colorMatrix(red: CIVector,
					 green: CIVector,
					 blue: CIVector,
					 alpha: CIVector) -> CIFilter{
		return CIFilter(name: "CIColorMatrix", parameters: [
			"inputRVector": red,
			"inputGVector": green,
			"inputBVector": blue,
			"inputAVector": alpha])!
	}
	
}
