//
//  File.swift
//  
//
//  Created by Matheus Zanivan on 18/04/23.
//


/*
 The filter values used to simulate color blindness were based on the MIT Copyright © 2014 PlanetCentauri license,
 available at: https://github.com/PlanetCentauri/ColorblindFilter/blob/master/LICENSE
 */

import Foundation
import CoreImage


// MARK: CAMERA FILTERS
struct CameraFilters {
	
	//Normal
	let normal = CIFilter().colorMatrix(
		red: CIVector(x: 1, y: 0, z: 0, w: 0),
		green: CIVector(x: 0, y: 1, z: 0, w: 0),
		blue: CIVector(x: 0, y: 0, z: 1, w: 0),
		alpha: CIVector(x: 0, y: 0, z: 0, w: 1))
	
	//PRotanopia
	let protanopia = CIFilter().colorMatrix(
		red: CIVector(x: 0.567, y: 0.433, z: 0, w: 0),
		green: CIVector(x: 0.558, y: 0.442, z: 0, w: 0),
		blue: CIVector(x: 0, y: 0.242, z: 0.758, w: 0),
		alpha: CIVector(x: 0, y: 0, z: 0, w: 1))
	
	//Deuteranopia
	let deuteranopia = CIFilter().colorMatrix(
		red: CIVector(x: 0.625, y: 0.375, z: 0, w: 0),
		green: CIVector(x: 0.7, y: 0.3, z: 0, w: 0),
		blue: CIVector(x: 0, y: 0.3, z: 0.7, w: 0),
		alpha: CIVector(x: 0, y: 0, z: 0, w: 1))
	
	//Tritanopia
	let tritanopia = CIFilter().colorMatrix(
		red: CIVector(x: 0.95, y: 0.05, z: 0, w: 0),
		green: CIVector(x: 0, y: 0.433, z: 0.567, w: 0),
		blue: CIVector(x: 0, y: 0.475, z: 0.525, w: 0),
		alpha: CIVector(x: 0, y: 0, z: 0, w: 1))
}
