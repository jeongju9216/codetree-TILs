func item(_ alphabet: String, _ values: [Int]) -> Int {
    values[dict[alphabet]!]
}

func cal(_ values: [Int]) -> Int {
    var result = 0
    var nums: [Int] = []
    var op = ""
    for ch in arr {
        if dict[ch] == nil {
            op = ch
        } else if nums.isEmpty {
            nums.append(item(ch, values))
        } else {
            let num1 = nums[0]
            let num2 = item(ch, values)
            if op == "+" {
                result = (num1 + num2)  
            } else if op == "-" {
                result = (num1 - num2)
            } else if op == "*" {
                result = (num1 * num2)
            }
            nums = [result]
        }
    }
    return result
}

func backtracking(_ values: [Int]) {
    guard values.count < dict.keys.count else {
        result = max(result, cal(values))
        return
    }

    for i in 1...4 {
        backtracking(values + [i])
    }
}

var arr = Array(readLine()!).map { String($0) }
var dict: [String: Int] = [:]
for ch in arr {
    if ch == "+" || ch == "-" || ch == "*" {
        continue
    }

    if dict[ch] == nil {
        dict[ch] = dict.keys.count
    }
}

var result = 0
backtracking([])
print(result)