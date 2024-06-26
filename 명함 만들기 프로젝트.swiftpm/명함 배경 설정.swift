import SwiftUI

// 명함 배경색, 명함 테두리를 설정할 수 있습니다!  

struct ContainerView: View {
    var body: some View {
        ContentView()
            .frame(width: 950, height: 528) // 🚫 수정 금지!!!! 🚫
            .background(.white) // 명함 배경색 설정하는 곳
            .border(.black) // 명함 테두리 설정
    }
}

#Preview { 
    ContainerView()
}
