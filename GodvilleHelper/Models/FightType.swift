enum FightType: String, CaseIterable {
    case sail = "sail"
    case arena = "arena"
    case challenge = "challenge"
    case dungeon = "dungeon"
    case range = "range"
    case none = ""
    
    var description: String {
        switch self {
        case .sail: return "в заплыве"
        case .arena: return "на арене"
        case .challenge: return "на тренировке"
        case .dungeon: return "в поодземелье"
        case .range: return "на полигоне"
        case .none: return ""
        }
    }
}
