// Copyright DApps Platform Inc. All rights reserved.

import Foundation
import Eureka

public struct MoacAddressRule<T: Equatable>: RuleType {

    public init(msg: String = "Invalid Moac Address") {
        self.validationError = ValidationError(msg: msg)
    }

    public var id: String?
    public var validationError: ValidationError

    public func isValid(value: T?) -> ValidationError? {
        if let str = value as? String {
            return !CryptoAddressValidator.isValidAddress(str) ? validationError : nil
        }
        return value != nil ? nil : validationError
    }
}
