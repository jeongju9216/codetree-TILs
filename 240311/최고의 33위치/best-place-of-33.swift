let std = 3

let n = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var result = 0
for i in 0...n-std {
    for j in 0...n-std {
        var sum = 0
        for x in i..<i+std {
            for y in j..<j+std {
                sum += board[x][y]
            }
        }
        result = max(result, sum)
    }
}

print(result)