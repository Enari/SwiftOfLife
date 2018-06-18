struct Array2D<Element> {
    let elements: [Element]
    let rows: Int
    let columns: Int
}

extension Array2D {
    init(rows: Int, columns: Int, elements: [Element]) {
        self.rows = rows
        self.columns = columns
        self.elements = elements
    }
}

extension Array2D {
    subscript(row: Int, column: Int) -> Element? {
        get {
            // Check if the subscript is out of bounds
            if row < 0 || column < 0 || row >= rows || column >= columns {
                return nil
            }
            
            return elements[row * columns + column]
        }
    }
}

extension Array2D {
    func enumerated() -> [(row: Int, column: Int, element: Element)] {
        var enumerated = [(Int, Int, Element)]()
        enumerated.reserveCapacity(elements.count)
        
        for (index, element) in elements.enumerated() {
            enumerated.append((index / columns, index % columns, element))
        }
        
        return enumerated
    }
}

extension Array2D {
    func mapi<T>(transformation: (Int, Int, Element) -> T) -> [T] {
        return enumerated().map(transformation)
    }
}
