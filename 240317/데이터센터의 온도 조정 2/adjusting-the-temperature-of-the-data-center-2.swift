func totalScore(_ tmp: Int) -> Int {
    var score = 0
    for i in 0..<n {
        if tmp < temp[i].ta {
            score += c
        } else if tmp > temp[i].tb {
            score += h
        } else {
            score += g
        }
    }
    return score
}

let ncgh = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = ncgh[0], c = ncgh[1], g = ncgh[2], h = ncgh[3]
var temp: [(ta: Int, tb: Int)] = []
for _ in 0..<n {
    let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    temp.append((ab[0], ab[1]))
}

var result = 0
for i in 0...1000 {
    result = max(result, totalScore(i))
}
print(result)