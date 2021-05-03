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

public extension SKError.Code {
    var description: String {
        switch self {
        case .unknown: return "unknown"
        case .clientInvalid: return "clientInvalid"
        case .paymentCancelled: return "paymentCancelled"
        case .paymentInvalid: return "paymentInvalid"
        case .paymentNotAllowed: return "paymentNotAllowed"
        case .storeProductNotAvailable: return "storeProductNotAvailable"
        case .cloudServicePermissionDenied: return "cloudServicePermissionDenied"
        case .cloudServiceNetworkConnectionFailed: return "cloudServiceNetworkConnectionFailed"
        case .cloudServiceRevoked: return "cloudServiceRevoked"
        case .privacyAcknowledgementRequired: return "privacyAcknowledgementRequired"
        case .unauthorizedRequestData: return "unauthorizedRequestData"
        case .invalidOfferIdentifier: return "invalidOfferIdentifier"
        case .invalidSignature: return "invalidSignature"
        case .missingOfferParams: return "missingOfferParams"
        case .invalidOfferPrice: return "invalidOfferPrice"
        case .overlayCancelled: return "overlayCancelled"
        case .overlayInvalidConfiguration: return "overlayInvalidConfiguration"
        case .overlayTimeout: return "overlayTimeout"
        case .ineligibleForOffer: return "ineligibleForOffer"
        case .unsupportedPlatform: return "unsupportedPlatform"
        case .overlayPresentedInBackgroundScene: return "overlayPresentedInBackgroundScene"
        @unknown default:
            return "unknown"
        }
    }
}
