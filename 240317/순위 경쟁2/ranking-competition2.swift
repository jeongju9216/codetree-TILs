func findTop() -> Set<String> {
    if aScore == bScore {
        return ["A", "B"]
    } else if aScore > bScore {
        return ["A"]
    } else {
        return ["B"]
    }
}

let n = Int(readLine()!)!
var scores: [(c: String, s: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    scores.append((input[0], Int(input[1])!))
}

var aScore = 0, bScore = 0
var result = 0
var top: Set<String> = findTop()

for (c, s) in scores {
    if c == "A" {
        aScore += s
    } else {
        bScore += s
    }
    
    let newTop = findTop()
    if top != newTop {
        top = newTop
        result += 1
    }
}

print(result)