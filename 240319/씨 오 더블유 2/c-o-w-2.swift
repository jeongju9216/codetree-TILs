let n = Int(readLine()!)!
let arr = Array(readLine()!).map { String($0) }

var result = 0
for i in 0..<n where arr[i] == "C" {
    for j in i+1..<n where arr[j] == "O" {
        for k in j+1..<n where arr[k] == "W" {
            result += 1
        }
    }
}
print(result)