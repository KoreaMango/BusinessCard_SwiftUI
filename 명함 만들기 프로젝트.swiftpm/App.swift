import SwiftUI

@main
struct DANGER: App {
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
