import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            CaptureStack {
                VStack {
                    ContainerView()
                    ContainerView()
                    ContainerView()
                }
            }
        }
    }
}
