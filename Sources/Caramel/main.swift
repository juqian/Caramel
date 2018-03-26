import CaramelFramework
import Foundation
import SwiftShell

if CommandLine.arguments.count > 1 {
  print("Building CFG:")
  print(NSDate().timeIntervalSince1970)
  let cfg = PartialCFG(contentsOfFile: CommandLine.arguments[1])
  let completeCFG = try! CompleteCFG(cfg: cfg)
  let pdg = PDG(cfg: completeCFG)

  // outputGraph(dotFormat: pdg.graphVizDotFormat())
  printSlice(pdg.slice(line: 12, column: 8)!, ofFile: CommandLine.arguments[1])
  print("Printed slice:")
  print(NSDate().timeIntervalSince1970)

} else {
  print("error: no file given")
}
