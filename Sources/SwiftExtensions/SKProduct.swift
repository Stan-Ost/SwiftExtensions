import StoreKit

public extension SKProduct {
    var localizedPrice: String? {
        return priceFormatter(locale: priceLocale).string(from: price)
    }
    
    private func priceFormatter(locale: Locale) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency
        return formatter
    }
    
    var localizedSubscriptionPeriod: String? {
        guard let subscriptionPeriod = self.subscriptionPeriod else { return nil }
        
        let dateComponents: DateComponents
        
        switch subscriptionPeriod.unit {
        case .day:
            dateComponents = DateComponents(day: subscriptionPeriod.numberOfUnits)
        case .week:
            dateComponents = DateComponents(weekOfMonth: subscriptionPeriod.numberOfUnits)
        case .month:
            dateComponents = DateComponents(month: subscriptionPeriod.numberOfUnits)
        case .year:
            dateComponents = DateComponents(year: subscriptionPeriod.numberOfUnits)
        @unknown default:
            fatalError()
        }
        
        return DateComponentsFormatter.localizedString(from: dateComponents, unitsStyle: .full)
    }
}

public extension SKProductDiscount {
    var localizedSubscriptionPeriod: String? {
        let dateComponents: DateComponents
        
        switch subscriptionPeriod.unit {
        case .day:
            dateComponents = DateComponents(day: subscriptionPeriod.numberOfUnits)
        case .week:
            dateComponents = DateComponents(weekOfMonth: subscriptionPeriod.numberOfUnits)
        case .month:
            dateComponents = DateComponents(month: subscriptionPeriod.numberOfUnits)
        case .year:
            dateComponents = DateComponents(year: subscriptionPeriod.numberOfUnits)
        @unknown default:
            fatalError()
        }
        
        return DateComponentsFormatter.localizedString(from: dateComponents, unitsStyle: .full)
    }
}
