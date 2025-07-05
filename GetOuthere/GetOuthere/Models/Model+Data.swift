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
                "Take a 20‑minute walk in a nearby park",
                "Visit a pet shelter and pet a dog or cat",
                "Help a neighbor with something small",
                "Take a calming yoga class nearby",
                "Grab coffee and sit in the first bench you find"
            ],
            "sad": [
                "Visit a local art gallery or museum",
                "Take a public transportation like a train or bus",
                "Spend time in a botanical garden",
                "Go to a cozy bookstore and browse",
                "Walk by the lake or river for fresh air"
            ],
            "anxious": [
                "Join a gentle group walk in nature",
                "Sit on a bench and practice deep breathing",
                "Visit a quiet neighborhood and take photos",
                "Attend a low pressure social meetup",
                "Go to an outdoor meditation session"
            ],
            "bored": [
                "Try a new food truck or street food vendor",
                "Take a dance or fitness class",
                "Check out a local festival or market",
                "Explore a new neighborhood on foot",
                "Visit an escape‑room or puzzle venue"
            ],
            "tired": [
                "Take a gentle bike ride around town",
                "Sit in a park and read a chapter of a book",
                "Take a short nap in a quiet cafe",
                "Go for a relaxing swim at a local pool",
                "Watch the sunset from a scenic spot"
            ],
            "okay": [
                "Walk to a nearby library and browse",
                "Go to a casual art/craft workshop",
                "Try a local coffee shop you've never been to",
                "Stroll through a park with a friend",
                "Catch an outdoor movie screening"
            ],
            "happy": [
                "Go for a joyful run in the neighborhood",
                "Visit a local fair or amusement park",
                "Grab ice cream from a new shop",
                "Attend a live music gig or open mic",
                "Plan a spontaneous picnic outdoors"
            ],
            "confidant": [
                "Walk into a new indie store and chat",
                "Join a meetup or networking event",
                "Go wine tasting or cooking class",
                "Perform at an open mic or improv night",
                "Lead a small group walk or gathering"
            ],
            "motivated": [
                "Go to a motivational seminar or workshop",
                "Run errands on foot instead of driving",
                "Visit the farmer’s market early in the morning",
                "Explore a new hiking trail nearby",
                "Volunteer at a local community project"
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
