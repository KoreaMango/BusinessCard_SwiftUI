import SwiftUI

struct ImageCaptureModule<Content: View>: View {
    @State private var _image: UIImage?
    let content: Content
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                content
                    .background(
                        GeometryReader { geometry in
                            Color.clear.onAppear {
                                _image = content
                                    .snapshot(size: geometry.size)
                            }
                        }
                    )
                    .padding()
            }
            .toolbar {
                if let image = _image {
                    ShareLink(
                        item: Image(uiImage: image),
                        preview: SharePreview("Image Capture", image: Image(uiImage: image))
                    )
                }
            }
        }
    }
}

extension View {
    @MainActor
    func snapshot(size: CGSize) -> UIImage? {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        view?.bounds = CGRect(origin: .zero, size: size)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }
    }
    func captureTarget<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        ImageCaptureModule(content: content())
    }
}

@ViewBuilder
func CaptureStack<Content: View>(@ViewBuilder content: () -> Content) -> some View {
    ImageCaptureModule(content: content())
}
