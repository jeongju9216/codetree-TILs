let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]

var queue = Array(1...n)
var count = 0, cursor = 0
var result: [Int] = []
while result.count < n {
    while true {
        if queue[cursor] > 0 {
            count += 1
            if count == k {
                break
            }
        }
        cursor += 1
        if cursor == n {
            cursor = 0
        }
    }
    
    result.append(queue[cursor])
    queue[cursor] = 0
    count = 0
}

result.forEach { print($0, terminator: " ") }