//
//  Node.swift
//  SLLabyrinthGenerator
//
//  Created by serhii.lomov on 07.03.2025.
//

import Foundation

final class Node<T: Topology> {
    var point: T.Point
    var element: LabyrinthElement<T>? = nil

    init(point: T.Point, element: LabyrinthElement<T>? = nil) {
        self.point = point
        self.element = element
    }
}
