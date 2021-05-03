import Foundation

struct WorldTime {
    let date: String
    let hoursFromGMT: Int
    let location: String
    let time: String
    
    static func generateData() -> [WorldTime] {
        let list = [("Asia/Seoul", "서울"), ("Asia/Tokyo", "도쿄"), ("America/New_York", "뉴욕"), ("Europe/Madrid", "마드리드") ,("Europe/Rome", "로마"), ("Europe/Paris", "파리"), ("Europe/London", "런던"), ("Europe/Zurich", "취리히")]
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.doesRelativeDateFormatting = true
        
        var result = [WorldTime]()
        for (timeZone, location) in list {
            guard let tz = TimeZone(identifier: timeZone) else { continue }
            
            let dt = now.addingTimeInterval(TimeInterval(tz.secondsFromGMT() - (9 * 3600)))
            
            formatter.dateStyle = .short
            formatter.timeStyle = .none
            let date = formatter.string(from: dt)
            
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            let time = formatter.string(from: dt)
            let hoursFromGMT = (tz.secondsFromGMT() / 3600) - 9
            
            let data = WorldTime(date: date, hoursFromGMT: hoursFromGMT, location: location, time: time)
            result.append(data)
        }
        
        return result
    }
}
