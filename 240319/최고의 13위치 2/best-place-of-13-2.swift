typealias Point = (x: Int, y: Int)

func isContains(_ arr: [Point], _ point: Point) -> Bool {
    for p in arr {
        if p.x == point.x && p.y == point.y {
            return true
        }
    }
    return false
}

func check(_ point: Point) -> Int {
    var arr: [Point] = [point, (point.x, point.y + 1), (point.x, point.y + 2)]
    var sum = arr.map { board[$0.x][$0.y] }.reduce(0, +)

    var maxSum = 0
    for i in 0..<n {
        for j in 0..<n-2 {
            guard !isContains(arr, (i, j)), 
                  !isContains(arr, (i, j + 1)), 
                  !isContains(arr, (i, j + 2)) 
            else {
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