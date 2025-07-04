import Foundation

extension Mood {
    static let allMoods: [Mood] = [
           Mood(id: "angry", emoji: "😡", colorName: "red"),
           Mood(id: "sad", emoji: "😢", colorName: "blue"),
           Mood(id: "anxious", emoji: "😰", colorName: "blue"),
           Mood(id: "bored", emoji: "😐", colorName: "gray"),
           Mood(id: "tired", emoji: "😴", colorName: "gray"),
           Mood(id: "okay", emoji: "🙂", colorName: "yellow"),
           Mood(id: "happy", emoji: "😄", colorName: "yellow"),
           Mood(id: "confidente", emoji: "😏", colorName: "green"),
           Mood(id: "motivated", emoji: "😉", colorName: "green")
       ]
}
