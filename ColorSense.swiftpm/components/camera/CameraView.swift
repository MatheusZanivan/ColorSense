//
//  File.swift
//  
//
//  Created by Matheus Zanivan on 18/04/23.
//

import SwiftUI
import AVFoundation
import CoreImage

struct CameraView : UIViewRepresentable{
	
	// MARK: AVCapture Propertie
	let captureSession = AVCaptureSession()
	
	// MARK: UIImageView -> Captured Image
	let imageView = UIImageView()
	
	//Filter to apply to the captured image
	@Binding var filter : CIFilter

	func makeUIView(context: Context) -> some UIView {
		captureSession.sessionPreset = .medium
		
		guard let captureDevice = AVCaptureDevice.default(for: .video) else { return imageView}
		guard let captureInput = try? AVCaptureDeviceInput(device: captureDevice) else { return imageView}
		captureSession.addInput(captureInput)
		
		let videoOutput = AVCaptureVideoDataOutput()
		videoOutput.setSampleBufferDelegate(context.coordinator, queue: DispatchQueue(label: "videoQueue"))
		
		captureSession.addOutput(videoOutput)
		
		DispatchQueue.global(qos: .background).async {
			captureSession.startRunning()
		}
		
		
		return imageView
		
	}
	func updateUIView(_ uiView: UIViewType, context: Context) {
		
	}
	
	//create a coordinator to hadle the captured frame output
	func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
	
	// MARK: Coordinator
	class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate{
		var parent: CameraView
		
		init(_ parent: CameraView){
			self.parent = parent
		}
		
		// MARK: CaptureOutput
		func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
			guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else{ return }
			
			var image = CIImage(cvPixelBuffer: pixelBuffer)
			parent.filter.setValue(image, forKey: kCIInputImageKey)
			image = parent.filter.outputImage ?? image
			
			//Exibe a imagem filtrada na view
			
			DispatchQueue.main.async {
				self.parent.imageView.image = UIImage(ciImage: image)
			}
		}
	}
}
