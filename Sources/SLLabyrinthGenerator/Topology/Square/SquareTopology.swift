//
//  SquareTopology.swift
//  SLLabyrinthGenerator
//
//  Created by serhii.lomov on 05.03.2025.
//

final class SquareTopology: Topology {
    typealias Point = SquarePoint
    typealias Edge = SquareEdge

    static func nextPoint(point: Point, edge: Edge) -> Point {
        switch edge {
        case .left: return SquarePoint(x: point.x - 1, y: point.y)
        case .right: return SquarePoint(x: point.x + 1, y: point.y)
        case .top: return SquarePoint(x: point.x, y: point.y + 1)
        case .bottom: return SquarePoint(x: point.x, y: point.y - 1)
        }
    }

    static func oppositeEdge(_ edge: SquareEdge) -> SquareEdge? {
        switch edge {
        case .left: return .right
        case .right: return .left
        case .top: return .bottom
        case .bottom: return .top
        }
    }

    static func visualScale(field: Field<SquareTopology>, width: Float, height: Float) -> Float {
        guard let field = field as? SquareField else { return 1 }
        let hScale = width / Float(field.size.0)
        let vScale = height / Float(field.size.1)
        return min(hScale, vScale)
    }

    static func visualPosition(_ point: SquarePoint) -> (Float, Float) {
        (Float(point.x) + 0.5, Float(point.y) + 0.5)
    }
}
