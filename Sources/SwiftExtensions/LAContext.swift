import LocalAuthentication

public enum BiometricType: String {
    case none
    case disabledTouchID
    case disabledFaceID
    case touchID
    case faceID
}

public extension LAContext {
    
    var biometricType: BiometricType {
        var error: NSError?
        
        guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            if error?.code == -6 {
                switch self.biometryType {
                case .none:
                    return .none
                case .touchID:
                    return .disabledTouchID
                case .faceID:
                    return .disabledFaceID
                @unknown default:
                    return .none
                }
            } else {
                return .none
            }
        }
        
        switch self.biometryType {
        case .none:
            return .none
        case .touchID:
            return .touchID
        case .faceID:
            return .faceID
        @unknown default:
            return .none
        }
    }
}
