guard let n = Int(readLine()!) else { fatalError("Need a number!")}
var sum = 0
var product = 1
var i = 1

while i < n {
  sum = sum + i
  product = product * i
  i = i + 1
}

print(product)
print(sum)
