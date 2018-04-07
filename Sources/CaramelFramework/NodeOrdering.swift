struct NodeOrdering {
  public let nodes: [Node]
  private let indices: [Node: Int]

  public init(array: [Node]) {
    var indices: [Node: Int] = [:]
    for (index, node) in array.enumerated() {
      indices[node] = index
    }
    self.nodes = array
    self.indices = indices
  }

  public func index(for node: Node) -> Int {
    if let index = indices[node] {
      return index
    } else {
      fatalError("No index for node")
    }
  }

  public func node(for index: Int) -> Node {
    return nodes[index]
  }

  public func areInIncreasingOrder(_ lhs: Node, _ rhs: Node) -> Bool {
    if let lhsNum = indices[lhs], let rhsNum = indices[rhs] {
      return lhsNum < rhsNum
    } else {
      fatalError("Couldn't get indices for nodes")
    }
  }

  public var description: String {
    var result = ""
    for node in nodes {
      switch node.type {
        case .start: result += "START"
        case .end: result += "END"
        default: result += try! node.range.content()
      }
      result += "\n"
    }
    return result
  }
}