//
//  UrgePreference+Extensions.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

// MARK: - Fixed Urges (Always Included in Diary Card)
let fixedUrges: [UrgePreference] = [
    UrgePreference(
        id: "suicide",
        title: "Suicide",
        description: "The urge to end your life or not want to be alive.",
        isFixed: true,
        isCustom: false
    ),
    UrgePreference(
        id: "self_harm",
        title: "Self Harm",
        description: "The urge to hurt yourself physically in any way.",
        isFixed: true,
        isCustom: false
    ),
    UrgePreference(
        id: "quit_dbt",
        title: "Quit DBT",
        description: "The urge to stop trying, quit DBT, or give up on healing.",
        isFixed: true,
        isCustom: false
    )
]

// MARK: - Predefined Optional Urges (User Can Select Up to 2)
let predefinedUrges: [UrgePreference] = [
    UrgePreference(id: "substance_urge", title: "Using Substances", description: "The urge to drink, smoke, or use drugs to escape or feel something different.", isFixed: false, isCustom: false),
    UrgePreference(id: "food_urge", title: "Restricting or Bingeing Food", description: "The urge to eat too much, not eat, or purge to feel in control or cope.", isFixed: false, isCustom: false),
    UrgePreference(id: "avoidance", title: "Running Away / Shutting Down", description: "The urge to disappear, ghost someone, avoid problems, or isolate.", isFixed: false, isCustom: false),
    UrgePreference(id: "destruction", title: "Breaking Things / Hurting Others", description: "The urge to yell, hit, throw things, or be destructive when overwhelmed.", isFixed: false, isCustom: false),
    UrgePreference(id: "impulsive_sex", title: "Impulsive Sexual Behavior", description: "The urge to use sex to numb, gain control, or avoid hard feelings.", isFixed: false, isCustom: false),
    UrgePreference(id: "spending", title: "Spending Money Impulsively", description: "The urge to shop or spend as a quick fix for emotional pain.", isFixed: false, isCustom: false),
    UrgePreference(id: "ending_relationships", title: "Ending Relationships Abruptly", description: "The urge to block, break up, or push someone away during conflict.", isFixed: false, isCustom: false),
    UrgePreference(id: "dropping_out", title: "Dropping Out of Life", description: "The urge to quit school, work, or your responsibilities completely.", isFixed: false, isCustom: false)
]

// MARK: - Helpers

extension UrgePreference {
    /// Creates a custom user-defined urge.
    static func custom(title: String) -> UrgePreference {
        UrgePreference(
            id: UUID().uuidString,
            title: title,
            description: "",
            isFixed: false,
            isCustom: true
        )
    }

    /// Converts the preference to a submission (for use in a DiaryEntry).
    func toSubmission(intensity: Int) -> UrgeSubmission {
        UrgeSubmission(
            id: self.id,
            title: self.title,
            intensity: intensity,
            isFixed: self.isFixed,
            isCustom: self.isCustom
        )
    }
}

extension Array where Element == UrgePreference {
    /// Returns all urges including the 3 fixed ones.
    func includingFixedUrges() -> [UrgePreference] {
        return fixedUrges + self
    }

    /// Returns only the custom-written urges.
    func customOnly() -> [UrgePreference] {
        return self.filter { $0.isCustom && !$0.isFixed }
    }

    /// Returns only the user-selected (non-fixed, non-custom) urges.
    func predefinedOnly() -> [UrgePreference] {
        return self.filter { !$0.isFixed && !$0.isCustom }
    }
}
