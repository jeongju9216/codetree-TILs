let dx = [-1, 1, 1, -1]
let dy = [1, 1, -1, 1]

func cross(_ x: Int, _ y: Int, _ w: Int, _ h: Int) -> Int {
    let move = [w, h, w, h]
    
    var sum = 0
    for t in 0..<4 {
        let maxX = x + dx[t] * move[t]
        let maxY = y + dy[t] * move[t]
        guard 0..<n ~= maxX,
              0..<n ~= maxY else {
            return 0
        }

        var nx = x
        var ny = y
        for i in 0..<move[t] {
            nx += dx[t]
            ny += dy[t]
            sum += board[nx][ny]
        }
    }

    return sum
}

let n = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var result = 0
for i in 0..<n {
    for j in 0..<n {
        for w in 1..<n {
            for h in 1..<n {
                let total = cross(i, j, w, h)
                result = max(result, total)
            }
        }
    }
}

print(result)