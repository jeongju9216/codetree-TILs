let n = Int(readLine()!)!
var board: [[Int]] = []
for i in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var result = 0
for i in 0..<n {
    for j in 0...(n-3) {
        let count = board[i][j..<j+3].filter { $0 == 1 }.count
        result = max(result, count)
    }
}

print(result)