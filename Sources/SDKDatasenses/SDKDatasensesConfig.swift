//
//  ONDatasenseConfig.swift
//
//
//  Created by Vo Duy That on 24/07/2024.
//

import Foundation

public struct SDKDatasensesConfig {
    let key: String
    let debugMode: Bool
    let firebasePlistFile: String?
    var enabled: Bool = true

    public init(key: String, debugMode: Bool, firebasePlistFile: String?) {
        self.key = key
        self.debugMode = debugMode
        self.firebasePlistFile = firebasePlistFile
    }
    
    mutating func updateEnabled(_ isEnbled: Bool) {
        self.enabled = isEnbled
    }
}
