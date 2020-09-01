import SwiftUI

struct DiaryVStack: View {
    @ObservedObject var heroHandler: GodvilleDataHandler
    
    var body: some View {
        VStack(spacing: 0) {
            if let hero = heroHandler.instance {
                if let diaryLast = hero.diary_last {
                    Spacer()
                        .frame(height: 10)
                    
                    HStack {
                        Text("Последняя запись в дневнике")
                            .font(.headline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding([.horizontal])
                    .padding(.bottom, 5)
                    
                    HStack {
                        Text(diaryLast)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 10)
                }
            }
        }
    }
}
