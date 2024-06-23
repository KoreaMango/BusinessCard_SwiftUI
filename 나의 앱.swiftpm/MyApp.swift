import SwiftUI

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            CaptureStack {
                ContentView()
                        .frame(width: 400, height: 200)
                        .background(.red)
            }
        }
    }
}
