//
//  DatasensesType+Extensions.swift
//
//
//  Created by Vo Duy That on 25/07/2024.
//

import Datasenses_iOS
import Foundation

extension Int32: DatasensesType {
    public func isValidNestedTypeAndValue() -> Bool {
        true
    }

    public func equals(rhs: Datasenses_iOS.DatasensesType) -> Bool {
        true
    }
}

extension Int64: DatasensesType {
    public func isValidNestedTypeAndValue() -> Bool {
        true
    }

    public func equals(rhs: Datasenses_iOS.DatasensesType) -> Bool {
        true
    }
}
