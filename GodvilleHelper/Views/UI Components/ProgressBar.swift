import SwiftUI

struct ProgressBar: View {
    var backgroundColor: Color
    var foregroundColor: Color
    var progress: CGFloat
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width , height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(backgroundColor)
                    
                    Rectangle()
                        .frame(width: min(progress * geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(foregroundColor)
                        .animation(.linear)
                }
                .cornerRadius(geometry.size.height / 2)
            }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(backgroundColor: .red,
                    foregroundColor: .red,
                    progress: 0.5)
            .frame(width: 100, height: 7)
            .fixedSize()
    }
}
