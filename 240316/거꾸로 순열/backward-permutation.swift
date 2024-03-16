func backtracking(_ arr: [Int]) {
    guard arr.count < n else {
        arr.forEach { print($0, terminator: " ") }
        print()
        return
    }

    for i in (1...n).reversed() where !visited[i] {
        visited[i] = true
        backtracking(arr + [i])
        visited[i] = false
    }
}

let n = Int(readLine()!)!
var visited = Array(repeating: false, count: n + 1)
backtracking([])