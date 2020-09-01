import SwiftUI

struct ProgressHStack: View {
    var title: String
    var description: String
    var progress: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        HStack(spacing: 0){
            Text(title)
                .fontWeight(.bold) +
            Text(description)
            
            Spacer()
                .frame(width: 20)
            
            ProgressBar(backgroundColor: backgroundColor, foregroundColor: foregroundColor, progress: progress)
                .frame(width: 100, height: 7)
            Spacer()
        }
    }
}

struct ProgressHStack_Previews: PreviewProvider {
    static var previews: some View {
        ProgressHStack(title: "Уровень: ",
                       description: "30",
                       progress: 0.3,
                       backgroundColor: .red,
                       foregroundColor: .yellow)
    }
}
