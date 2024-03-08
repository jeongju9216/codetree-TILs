let n = Int(readLine()!)!
let cows = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = 0
for i in 0..<n {
    for j in i+1..<n {
        for k in j+1..<n {
            if cows[i] <= cows[j] && cows[j] <= cows[k] {
                result += 1
            }
        }
    }
}

print(result)