//
//  ActionPreferenceConstants.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

/// Namespace for fixed and predefined ActionPreference constants used throughout the app.
enum ActionPreferenceConstants {
    
    /// Always-included DBT safety actions.
    static let fixedActions: [ActionPreference] = [
        ActionPreference(
            id: "suicide",
            title: "Suicide",
            description: "Experiencing thoughts of suicide or wishing to end your life.",
            isFixed: true,
            isCustom: false
        ),
        ActionPreference(
            id: "self_harm",
            title: "Self Harm",
            description: "Hurting yourself physically in any way, even small acts.",
            isFixed: true,
            isCustom: false
        )
    ]
    
    /// Optional predefined actions the user can choose during onboarding.
    static let predefinedActions: [ActionPreference] = [
        ActionPreference(id: "substance_use", title: "Substance Use", description: "Using alcohol or drugs to cope with pain or numb emotions.", isFixed: false, isCustom: false),
        ActionPreference(id: "disordered_eating", title: "Disordered Eating", description: "Restricting, bingeing, or purging food as a way to deal with emotions or regain control.", isFixed: false, isCustom: false),
        ActionPreference(id: "lashing_out", title: "Lashing Out at Others", description: "Yelling, threatening, or saying things you don’t mean when you’re upset.", isFixed: false, isCustom: false),
        ActionPreference(id: "withdrawing", title: "Withdrawing from People", description: "Isolating or cutting off others when you’re hurting or overwhelmed.", isFixed: false, isCustom: false),
        ActionPreference(id: "skipping_therapy", title: "Skipping Therapy or DBT Practice", description: "Avoiding appointments or not using skills when you meant to.", isFixed: false, isCustom: false),
        ActionPreference(id: "risky_sex", title: "Risky Sexual Behavior", description: "Engaging in sexual behavior that feels impulsive, unsafe, or unaligned with your values.", isFixed: false, isCustom: false),
        ActionPreference(id: "impulsive_spending", title: "Overspending or Impulsive Shopping", description: "Spending money in ways that feel compulsive or bring guilt.", isFixed: false, isCustom: false),
        ActionPreference(id: "self_neglect", title: "Self-Neglect", description: "Going long periods without hygiene, eating, sleeping, or caring for your body.", isFixed: false, isCustom: false),
        ActionPreference(id: "avoiding_responsibilities", title: "Avoiding Responsibilities", description: "Ignoring school, work, or other obligations due to overwhelm or avoidance.", isFixed: false, isCustom: false),
        ActionPreference(id: "breaking_rules", title: "Breaking Rules or the Law", description: "Engaging in illegal, high-risk, or impulsive behaviors.", isFixed: false, isCustom: false)
    ]
}
