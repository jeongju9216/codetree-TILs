typealias Point = (x: Int, y: Int)

func check(_ p: Point) -> Int {
    let sum = board[p.x][p.y] + board[p.x][p.y+1] + board[p.x][p.y+2]

    var maxSum = 0
    for i in 0..<n {
        for j in 0..<n-2 {
            if p.x == i && abs(p.y - j) <= 2 {
                continue
            }

            let newSum = sum + board[i][j] + board[i][j+1] + board[i][j+2]
            maxSum = max(maxSum, newSum)
        }
    }

    return maxSum
}

let n = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var result = 0
for i in 0..<n {
    for j in 0..<n-2 {
        let sum = check((i, j))
        result = max(result, sum)
    }
}
print(result)