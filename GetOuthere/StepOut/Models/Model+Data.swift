import Foundation

extension Mood {
    static let allMoods: [Mood] = [
        Mood(id: "angry", emoji: "😡", colorName: "red"),
        Mood(id: "sad", emoji: "😢", colorName: "blue"),
        Mood(id: "anxious", emoji: "😰", colorName: "blue"),
        Mood(id: "bored", emoji: "😐", colorName: "brown"),
        Mood(id: "tired", emoji: "😴", colorName: "brown"),
        Mood(id: "okay", emoji: "🙂", colorName: "yellow"),
        Mood(id: "happy", emoji: "😄", colorName: "yellow"),
        Mood(id: "confidant", emoji: "😏", colorName: "green"),
        Mood(id: "motivated", emoji: "😉", colorName: "green")
    ]
}


extension Mission {
    static var allMissions: [Mission] {
        var missions: [Mission] = []
        
        let moodMissions: [String: [String]] = [
            "angry": [
                "Take a brisk 10-minute walk to cool down.",
                "Take a quick jog around your block.",
                "Write down what's making you angry and rip the paper.",
                "Try a 5-minute breathing meditation.",
                "Listen to music that helps you release tension."
            ],
            "sad": [
                "Write a short letter to your future self.",
                "Watch a heartwarming video or short film.",
                "Call or message someone you trust.",
                "Go outside and sit in nature for 10 minutes.",
                "Make a gratitude list of 3 things."
            ],
            "anxious": [
                "Try a guided breathing exercise.",
                "Declutter one small space around you.",
                "Write down your anxious thoughts and reframe them.",
                "Drink a warm cup of tea while sitting quietly.",
                "Do a quick 10-minute yoga/stretching session."
            ],
            "bored": [
                "Explore a new place within walking distance.",
                "Try drawing or doodling for 5 minutes.",
                "Look up a fun fact and share it with someone.",
                "Create a random photo challenge and complete it.",
                "Do a spontaneous dance to your favorite song."
            ],
            "tired": [
                "DTake a refreshing bath.",
                "Take a power nap (20 minutes max).",
                "Call a friend for a casual chat.",
                "Step outside for fresh air and sunlight.",
                "Write down one thing you're proud of today."
            ],
            "okay": [
                "Set a small goal and complete it in the next hour.",
                "Send a kind message to someone.",
                "Try something new for 10 minutes (food, music, etc).",
                "Clean one thing you've been avoiding.",
                "Add something to your bucket list."
            ],
            "happy": [
                "Try a new coffee shop.",
                "Share your good vibes with someone.",
                "Do something spontaneous and joyful.",
                "Pay it forward with a small act of kindness.",
                "Make a short video or note about what made you happy."
            ],
            "confidant": [
                "Challenge yourself to do something bold today.",
                "Teach someone something you know.",
                "Write down 3 personal strengths.",
                "Record a voice note celebrating yourself.",
                "Help someone else feel confident too."
            ],
            "motivated": [
                "Take the first step on a big idea you’ve been putting off.",
                "Organize your workspace for maximum focus.",
                "List your top 3 goals for the week.",
                "Push your limits in a physical or creative task.",
                "Inspire someone else by sharing your progress."
            ]
        ]
        
        
        for (moodID, texts) in moodMissions {
            for text in texts {
                missions.append(
                    Mission(
                        text: text,
                        point: Int.random(in: 3...15),
                        moodID: moodID,
                        completed: false,
                        date: Calendar.current.startOfDay(for: Date())
                    )
                )
            }
        }
        
        return missions
    }
}
