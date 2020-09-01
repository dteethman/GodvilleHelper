import SwiftUI

struct TextHStack: View {
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            (Text(title).fontWeight(.bold) + Text(description))
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
        }
        
    }
}
