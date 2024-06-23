import SwiftUI

struct ImageCaptureModule<Content: View>: View {
    @State private var _image: UIImage?
    let content: Content
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Spacer()
                if let business = content
                    .snapshot() {
                    Image(uiImage: business)
                        .frame(minHeight: 150)
                        .onAppear {
                            _image = business
                        }
                }
                Spacer()
            }
            .padding()
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
    func snapshot(scale: CGFloat? = nil) -> UIImage? {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
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
