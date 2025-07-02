import Foundation

class MissionData {
    static let shared = MissionData()
    
    private let missions: [Mission] = [
        Mission(text: "Sit outside for 5 minutes and focus on your breath."),
        Mission(text: "Touch 3 different textures in nature (tree, stone, grass)."),
        Mission(text: "Close your eyes and name 5 sounds you hear."),
        Mission(text: "Take a deep breath every time you see a tree."),
        Mission(text: "Smell 3 natural things (flower, air, leaf, bark)."),
        
        Mission(text: "Take a photo of something that feels peaceful."),
        Mission(text: "Find 3 things shaped like circles."),
        Mission(text: "Look up and draw the first cloud shape you see."),
        Mission(text: "Write a 1-sentence story inspired by something you saw today."),
        Mission(text: "Take a photo of something small that most people miss."),
        
        Mission(text: "Wave or smile at 3 people while you're out."),
        Mission(text: "Leave a kind note somewhere public."),
        Mission(text: "Send someone a photo of what you're doing right now."),
        Mission(text: "Call someone and tell them where you are."),
        Mission(text: "Buy a coffee or treat and enjoy it outside, without distractions."),
        
        Mission(text: "Wave or smile at 3 people while you're out."),
        Mission(text: "Leave a kind note somewhere public."),
        Mission(text: "Send someone a photo of what you're doing right now."),
        Mission(text: "Call someone and tell them where you are."),
        Mission(text: "Buy a coffee or treat and enjoy it outside, without distractions."),
        
        Mission(text: "If it's sunny, sit in the light and close your eyes for a minute."),
        Mission(text: "If it's raining, listen to the sound without judgment."),
        Mission(text: "Find shelter and observe the rain — what does it make you feel?"),
        Mission(text: "If it's windy, stretch your arms out and feel it pass through you."),
    ]
    
    func getMission() -> Mission {
        return missions.randomElement() ?? Mission(text: "Not mission for today")
    }
}
