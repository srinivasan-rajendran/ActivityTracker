//
//  Binding+Extension.swift
//  ActivityTracker
//
//  Created by Srinivasan Rajendran on 2022-01-29.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
