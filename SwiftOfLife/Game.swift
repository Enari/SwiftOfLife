/// Returns neighours for the cell at position
func neighboursForCell(at position: (Int, Int), state: State) -> [Cell] {
    let (row, column) = position
    var neighbours = [Cell]()
    
    for i in row-1 ... row+1 {
        for j in column-1 ... column+1 {
            // Self should not be includes as a neighbour
            if i == row && j == column {
                continue
            }
            
            if let neighbour = state[i, j] {
                neighbours.append(neighbour)
            }
        }
    }
    
    return neighbours
}

extension Array where Element == Cell {
    /// Returns the alive cells that are alive
    func alive() -> [Cell] {
        return self.filter { $0.state == Cell.State.alive }
    }
}


func ruleOfLife(cell: Cell, neighbours: [Cell]) -> Cell.State {
    let aliveNeigbours = neighbours.alive().count
    
    switch (cell.state, aliveNeigbours) {
    case (.dead,  3): return .alive
    case (.alive, 2): return .alive
    case (.alive, 3): return .alive
    default         : return .dead
    }
}
    
func nextState(from state: State) -> State {
    let cells = state.mapi { row, column, element -> Cell in
        let neighbours = neighboursForCell(at: (row, column), state: state)
        let state = ruleOfLife(cell: state[row, column]!, neighbours: neighbours)
        return Cell(state: state)
    }
    
    return State(rows: state.rows, columns: state.columns, elements: cells)
}
