import Source

public extension SourceLocation {
  public func offset() throws -> Int {
    return try LineColumnResolver.resolve(
      line: self.line,
      column: self.column,
      filePath: self.identifier
    )
  }
}