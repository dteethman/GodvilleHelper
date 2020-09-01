import SwiftUI

struct QuestVStack: View {
    @ObservedObject var heroHandler: GodvilleDataHandler
    
    var body: some View {
        VStack(spacing: 0) {
            if let hero = heroHandler.instance {
                Spacer()
                    .frame(height: 10)
                
                if let quest = hero.quest {
                    HStack {
                        Text("Задание")
                            .font(.headline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding([.horizontal])
                    .padding(.bottom, 5)
                    
                    TextHStack(title: "🎯 Цель: ", description: "\(quest)")
                        .frame(height: 25, alignment: .leading)
                        .padding(.horizontal)
                    
                    if let progress = hero.quest_progress {
                        ProgressHStack(title: "⚙️ Выполнено: ",
                                       description: "\(String(progress))%",
                                       progress: (CGFloat(progress) / 100),
                                       backgroundColor: .blue,
                                       foregroundColor: .blue)
                            .frame(height: 25, alignment: .leading)
                            .padding(.horizontal)
                    }
                }
                
                Spacer()
                    .frame(height: 10)
                
            }
        }
    }
}
