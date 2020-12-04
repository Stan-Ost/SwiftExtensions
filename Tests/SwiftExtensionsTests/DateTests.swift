@testable import SwiftExtensions
import XCTest

final class DateTests: XCTestCase {
    var date1: Date!
    var date2: Date!
    var date3: Date!
    var roundedDate2: Date!
    
    override func setUp() {
        super.setUp()
        
        let strDate1 = "December 25, 2019, 7:00:00 AM"
        let strDate2 = "December 27, 2019, 8:10:10 AM"
        let strDate3 = "March 1, 2021, 11:15:00 PM"
        let roundedDate2Str = "December 27, 2019, 8:00:00 AM"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy, hh:mm:ss a"
                
        date1 = formatter.date(from: strDate1)!
        date2 = formatter.date(from: strDate2)!
        date3 = formatter.date(from: strDate3)!
        roundedDate2 = formatter.date(from: roundedDate2Str)!
    }
    
    override func tearDown() {
        date1 = nil
        date2 = nil
        date3 = nil
        roundedDate2 = nil
        
        super.tearDown()
    }

    func test_hourAndMinute_setCorrect() {
        let calendar = Calendar.current
        let hour = 7
        let minute = 0
        var dateComponents = DateComponents()
        
        dateComponents.calendar = calendar
        dateComponents.minute = minute
        dateComponents.hour = hour
        
        let expectedDate = dateComponents.date
        
        XCTAssertEqual(date1.hourAndMinute, expectedDate)
    }
    
    func test_day_returnsCorrectDay() {
        XCTAssertEqual(date1.day, 25)
    }
    
    func test_month_returnsCorrectDay() {
        XCTAssertEqual(date1.month, 12)
    }
    
    func test_year_returnsCorrectDay() {
        XCTAssertEqual(date1.year, 2019)
    }
    
    func test_secondsFrom_returnsCorrectSeconds() {
        XCTAssertEqual(date2.seconds(from: date1), 177010)
    }
    
    func test_minutesFrom_returnsCorrectSeconds() {
        XCTAssertEqual(date2.minutes(from: date1), 2950)
    }
    
    func test_hoursFrom_returnsCorrectSeconds() {
        XCTAssertEqual(date2.hours(from: date1), 49)
    }
    
    func test_daysFrom_returnsCorrectSeconds() {
        XCTAssertEqual(date2.days(from: date1), 2)
    }
    
    func test_weeksFrom_returnsCorrectSeconds() {
        XCTAssertEqual(date3.weeks(from: date1), 61)
    }
    
    func test_monthsFrom_returnsCorrectSeconds() {
        XCTAssertEqual(date3.months(from: date1), 14)
    }
    
    func test_yearsFrom_returnsCorrectSeconds() {
        XCTAssertEqual(date3.years(from: date1), 1)
    }
    
    func test_round_retursCorrectDate() {
        XCTAssertEqual(date2.round(precision: 60 * 30), roundedDate2)
    }
}
