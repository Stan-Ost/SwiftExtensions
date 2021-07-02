import Foundation

public extension Date {
    private var components: DateComponents {
        return calendar.dateComponents(in: calendar.timeZone, from: self)
    }
    
    private var calendar: Calendar {
        var current = Calendar.current
        current.timeZone = TimeZone.current
        current.locale = Locale.current
        return current
    }
    
    var hour: Int {
        return components.hour!
    }

    var day: Int {
        return components.day!
    }
    
    var weekday: Int {
        return components.weekday!
    }
    
    var month: Int {
        return components.month!
    }
    
    var year: Int {
        return components.year!
    }
    
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return calendar.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return calendar.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return calendar.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return calendar.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return calendar.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return calendar.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return calendar.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    func round(precision: TimeInterval) -> Date {
        return round(precision: precision, rule: .toNearestOrAwayFromZero)
    }
    
    var hourAndMinute: Date? {
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.minute = minute
        dateComponents.hour = hour
        
        return dateComponents.date
    }
    
    private func round(precision: TimeInterval, rule: FloatingPointRoundingRule) -> Date {
        let seconds = (self.timeIntervalSinceReferenceDate / precision).rounded(rule) * precision
        return Date(timeIntervalSinceReferenceDate: seconds)
    }
}
