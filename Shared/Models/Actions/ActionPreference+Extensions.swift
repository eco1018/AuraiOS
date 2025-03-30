//
//  ActionPreference+Extensions.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

extension ActionPreference {
    func toSubmission(didOccur: Bool) -> ActionSubmission {
        ActionSubmission(
            id: self.id,
            title: self.title,
            isFixed: self.isFixed,
            isCustom: self.isCustom,
            occurred: didOccur
        )
    }
}
