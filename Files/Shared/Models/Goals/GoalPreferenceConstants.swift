//
//  GoalPreferenceConstants.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

/// Central list of predefined goals users may choose from during onboarding.
enum GoalPreferenceConstants {
    
    static let predefinedGoals: [GoalPreference] = [
        GoalPreference(id: "use_skill", title: "Use a DBT Skill", description: "Practice any skill today — even just one counts. That’s a win.", isCustom: false),
        GoalPreference(id: "reach_out", title: "Reach Out to Someone Supportive", description: "Talk to someone, even briefly — a friend, group chat, or therapist.", isCustom: false),
        GoalPreference(id: "routine", title: "Follow My Morning or Night Routine", description: "Stick to your routine as best you can — morning, night, or both.", isCustom: false),
        GoalPreference(id: "eat_meal", title: "Eat a Nourishing Meal", description: "Feed your body. Food is fuel, not a reward or punishment.", isCustom: false),
        GoalPreference(id: "move_body", title: "Move My Body (Stretch, Walk, etc.)", description: "Reconnect with your body through a gentle stretch, walk, or breath.", isCustom: false),
        GoalPreference(id: "get_out_of_bed", title: "Get Out of Bed", description: "Take that brave first step — even if that’s all you did today, it matters.", isCustom: false),
        GoalPreference(id: "self_kindness", title: "Be Kind to Myself When I Struggle", description: "Offer yourself grace instead of judgment — especially on the hard days.", isCustom: false),
        GoalPreference(id: "ask_for_help", title: "Ask for Help When I Need It", description: "You don’t have to do it alone. Asking for help is a strength.", isCustom: false),
        GoalPreference(id: "self_care", title: "Do Something Just for Me", description: "Choose one small thing that’s just for you — even if it’s five minutes.", isCustom: false),
        GoalPreference(id: "live_values", title: "Do One Thing That Aligns with My Values", description: "Take a step toward the kind of person you want to be.", isCustom: false)
    ]
}
