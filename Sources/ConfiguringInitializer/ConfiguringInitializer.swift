//
//  ConfiguringInitializer.swift
//  ConfiguringInitializer
//
//  Created by Joseph A. Wardell on 10/15/19.
//
protocol ConfiguringInitializer : class {
    init()
}

// now give that protocol an extra init method
// that takes a closure to configure
// the object being initted
extension ConfiguringInitializer {
    
    init(_ configuration:(Self)->()) {
        self.init()
        configuration(self)
    }
}

#if (os(macOS) || os(iOS) || os(watchOS) || os(tvOS))
import Foundation
extension NSObject : ConfiguringInitializer {}
#endif
