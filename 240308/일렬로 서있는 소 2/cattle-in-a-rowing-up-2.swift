let n = Int(readLine()!)!
let cows = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = 0
for i in 0..<n {
    for j in i..<n {
        for k in j..<n {
            guard i != j && j != k && i != k else {
                continue
            }
            
            if cows[i] <= cows[j] && cows[j] <= cows[k] {
                result += 1
            }
        }
    }
}

print(result)