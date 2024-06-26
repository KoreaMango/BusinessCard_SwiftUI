import SwiftUI

// ⭐️ 여기에 명함을 만들어주세요! 
// 폰트 최소 글씨 : 36

// [명함 내용 설정] 프리뷰를 통해서 명함을 확인하세요!

struct ContentView: View {
    var body: some View {
        VStack {
            Image("iga x charming swift")
                .resizable()
                .frame(width: 200, height: 200)
                .offset(x: 0, y: 0) 
            Text("IGA x Charming Swift")
                .font(.system(size: 72, weight: .bold))
                .padding()
            Text("세션2: 명함 만들기")
                .font(.system(size: 36, weight: .medium))
                .foregroundColor(.blue)
                .padding()
        } 
    }
}

#Preview { 
    ContainerView()
}
