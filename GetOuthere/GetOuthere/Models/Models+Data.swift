import Foundation

final class MissionData {
    static let shared = MissionData()
    
    private init() {} 
    
    private let allMissions: [Mission] = [
        // Happy
        Mission(text: "Take a photo of something that feels peaceful.", points: 5, mood: .happy),
        Mission(text: "Look up and draw the first cloud shape you see.", points: 9, mood: .happy),
        Mission(text: "Sit outside for 5 minutes and focus on your breath.", points: 3, mood: .happy),

        // Sad
        Mission(text: "Call someone and tell them where you are.", points: 9, mood: .sad),
        Mission(text: "Send someone a photo of what you're doing right now.", points: 3, mood: .sad),
        Mission(text: "Write a story inspired by something you saw today.", points: 7, mood: .sad),

        // Angry
        Mission(text: "Touch 3 different textures in nature (tree, stone, grass).", points: 9, mood: .angry),
        Mission(text: "Take a deep breath every time you see a tree.", points: 5, mood: .angry),
        Mission(text: "Find 3 things shaped like circles.", points: 3, mood: .angry),

        // Anxious
        Mission(text: "Close your eyes and name 5 sounds you hear.", points: 3, mood: .anxious),
        Mission(text: "Smell 3 natural things (flower, air, leaf, bark).", points: 6, mood: .anxious),

        // Motivated
        Mission(text: "Wave or smile at 3 people while you're out.", points: 9, mood: .motivated),
        Mission(text: "Leave a kind note somewhere public.", points: 6, mood: .motivated),

        // Bored
        Mission(text: "Find shelter and observe the rain, what does it make you feel?", points: 7, mood: .bored),
        Mission(text: "If it’s windy, stretch your arms out and feel it pass through you.", points: 6, mood: .bored),
        Mission(text: "Go to a park and observe how the leafs of the trees moves in the wind.", points: 9, mood: .bored),

        // Tired
        Mission(text: "Buy a coffee or treat and enjoy it outside, without distractions.", points: 7, mood: .tired),
        Mission(text: "If it’s sunny, sit in the light and close your eyes for a minute.", points: 4, mood: .tired),

        // Okay
        Mission(text: "Take a photo of something small that most people miss.", points: 6, mood: .okay),
        Mission(text: "Go out and try a new street", points: 7, mood: .okay),

        // Confidente
        Mission(text: "Talk to a stranger and give a compliment.", points: 9, mood: .confidente),
        Mission(text: "Go oustise and dance", points: 9, mood: .confidente)
    ]
    
    func getMission(for mood: Mood) -> Mission {
        let filtered = allMissions.filter { $0.mood == mood }
        return filtered.randomElement() ?? Mission(text: "No missions found for your mood. Just Get Outhere", points: 0, mood: mood)
    }
}

