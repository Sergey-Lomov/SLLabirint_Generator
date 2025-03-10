//
//  CornerPath.swift
//  SLLabyrinthGenerator
//
//  Created by serhii.lomov on 05.03.2025.
//

import Foundation

/// A labyrinth element with two entrances on non-opposite sides.
class CornerPath<T: Topology>: EdgeBasedElement<T> {
    init(path: (T.Edge, T.Edge)) {
        super.init(passages: [path.0, path.1])
    }
}

class CornerPathSuperposition<T: Topology>: LabyrinthElementSuperposition<T> {
    var paths = T.Edge.allCases.pairs().removeOppositePairs()

    override var entropy: Int {
        paths.count
    }

    override func applyRestriction(_ restriction: ElementRestriction<T>) {
        switch restriction {
        case .wall(let edge):
            paths = paths.filter { $0 != edge && $1 != edge }
        case .passage(let edge):
            paths = paths.filter { $0 == edge || $1 == edge }
        }
    }

    override func waveFunctionCollapse() -> LabyrinthElement<T>? {
        guard let path = paths.randomElement() else { return nil }
        return CornerPath(path: path)
    }
}
