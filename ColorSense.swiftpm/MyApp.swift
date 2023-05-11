import SwiftUI

@main
struct MyApp: App {
	@State private var showingAlert = true
	var body: some Scene {
		WindowGroup {
			WelcomeView()
				.alert(isPresented: $showingAlert){
					Alert(title: Text("Landscape mode required"), message: Text("To use this app, please switch to landscape mode. If you need to change the orientation of your device, please restart the app to ensure optimal performance."), dismissButton: .default(Text("OK")))
				}
		}
	}
}
