enum HeroAlignment: String, CaseIterable {
    case neutral = "нейтральный"
    case dissatisfied = "недовольный"
    case angry = "озлобленный"
    case aggressive = "агрессивный"
    case evil = "злобный"
    case pureEvil = "чистое зло"
    case pureEvilPlus = "чистое зло!"
    case friendly = "беззлобный"
    case goodNatured = "добродушный"
    case peacefull = "миролюбивый"
    case virtuous = "добродетельный"
    case absoluteGood = "абсолютное добро"
    case absoluteGoodPlus = "абсолютное добро!"
    case none = ""
    
    var emoji: String {
        switch self {
        case .neutral: return "🙂"
        case .dissatisfied: return "😠"
        case .angry: return "😠"
        case .aggressive: return "😠"
        case .evil: return "😡"
        case .pureEvil: return "👹"
        case .pureEvilPlus: return "👹"
        case .friendly: return "😌"
        case .goodNatured: return "😌"
        case .peacefull: return "😌"
        case .virtuous: return "☺️"
        case .absoluteGood: return "😇"
        case .absoluteGoodPlus: return "😇"
        case.none : return ""
        }
    }
    
    var description: String {
        return self.rawValue
    }
}
