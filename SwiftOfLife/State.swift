typealias State = Array2D<Cell>

extension Array2D where Element == Cell {
    /// Initialize a random state
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.elements = (0 ..< rows * columns).map({ _ in Cell() })
    }
    
    /// Initialize a n * n random State
    init(dimention n: Int) {
        self.init(rows: n, columns: n)
    }
}

extension Array2D : CustomStringConvertible where Element == Cell {
    var description: String {
        let description = mapi { _, column, cell in
            column+1 == columns ? "\(cell)\n" : "\(cell)"
        }
        
        return description.reduce("", +)
    }
}
