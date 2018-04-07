//
//  JailbreakDetector.swift
//  stachka2018
//
//  Copyright © 2018 *. All rights reserved.
//

import Foundation


struct JailbreakDetector {
    
    // MARK: - Public methods
    
    static func jailbroken() -> Bool {
        return (writeOutSandbox() || hasCydiaBundle() || outSandbox())
    }

    
    // MARK: - Private methods
    
    private static func hasCydiaBundle() -> Bool {
        let filePath = "/Applications/Cydia.app"
        return FileManager.default.fileExists(atPath: filePath)
    }
    
    private static func outSandbox() -> Bool {
        let filePath = "/private/var/lib/apt/"
        return FileManager.default.fileExists(atPath: filePath)
    }
    
    private static func writeOutSandbox() -> Bool {
        do {
            let filePath = "/private/test.txt"
            let fileContents = "test"
            try fileContents.write(toFile: filePath, atomically: true, encoding: .utf8)
            try? FileManager.default.removeItem(atPath: filePath)
            return true
        } catch {
            return false
        }
    }
    
}
