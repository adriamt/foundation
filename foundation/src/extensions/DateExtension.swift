import UIKit

extension Date {
    
    public static func parse(_ date:String) -> Date? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = date.count == 10 ? "yyyy-MM-dd" : "yyyy-MM-dd HH:mm:ss"
        return dateFormatterGet.date(from: date)
    }
    
    public var time: String {
        let components: DateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: self)
        return "\(components.hour!):\(components.minute!):\(components.second!)"
    }
    
    public var weekDay: Int {
        let calendar =  Calendar.current;
        var dayOfWeek = calendar.component(.weekday, from: self)
        /*if (calendar.firstWeekday == 1) {
         dayOfWeek -= 1;
         }*/
        if dayOfWeek <= 0 {
            dayOfWeek += 7
        }
        return dayOfWeek;
    }

    
    public func toUTCDatetimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "Y-MM-dd H:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: self)
    }
    
    public func toSimpleDatetimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "Y-MM-dd H:mm"
        return dateFormatter.string(from: self)
    }
    
    public var toDatetimeString : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: self)
    }
    
    public var toDateTimeLocalized : String {
        return DateFormatter.localizedString(from: self, dateStyle: .short, timeStyle: .none)
    }
}