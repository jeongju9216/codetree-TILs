let n = Int(readLine()!)!
var arrB: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    arrB.append(input)
}

var result = 0
var remainingCards = Set(1...arrB.count * 2)

for card in arrB {
    let higherCards = remainingCards.filter { $0 > card }
    if !higherCards.isEmpty {
        let maxHigherCard = higherCards.max()!
        result += 1
        remainingCards.remove(maxHigherCard)
    } else {
        remainingCards.remove(card)
    }
}

print(result)