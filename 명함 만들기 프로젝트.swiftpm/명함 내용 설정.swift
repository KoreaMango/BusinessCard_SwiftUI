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
                // 아래 주석을 풀면 사진이 이동하는 것을 확인할 수 있습니다 (cmd + /)
//                .offset(x: -300, y: 0) 
                
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

#Preview(body: { 
    ContainerView()
})

