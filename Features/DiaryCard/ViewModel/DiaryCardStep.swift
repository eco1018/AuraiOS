//
//  DiaryCardStep.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

enum DiaryCardStep: Int, CaseIterable {
    case emotions
    case urges
    case actions
    case goals
    case medications
    case note
    case wrapUp

    func next() -> DiaryCardStep {
        let all = Self.allCases
        let idx = all.firstIndex(of: self)!
        return idx + 1 < all.count ? all[idx + 1] : self
    }

    func previous() -> DiaryCardStep {
        let all = Self.allCases
        let idx = all.firstIndex(of: self)!
        return idx - 1 >= 0 ? all[idx - 1] : self
    }
}
