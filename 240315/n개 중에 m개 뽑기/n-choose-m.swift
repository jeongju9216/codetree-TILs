func backtracking(_ arr: [Int], _ index: Int) {
    guard arr.count < m else {
        arr.forEach { print($0, terminator: " ") }
        print()
        return
    }
    
    if index > n {
        return
    }

    for i in index...n {
        backtracking(arr + [i], i + 1)
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]

backtracking([], 1)