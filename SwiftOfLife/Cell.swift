struct Cell {
    let state : State
}

extension Cell {
    enum State {
        case alive
        case dead
    }
}

extension Cell {
    /// Initializes a Cell with a random state
    init() {
        if Bool.random() {
            self.init(state: .alive)
        } else {
            self.init(state: .dead)
        }
    }
}

extension Cell: CustomStringConvertible {
    var description : String {
        // Alternative symbols: ⬜︎⬛︎⃞ 🔲⬛️ ⬜️⬛️
        return state == .alive ? "⬜️" : "⬛️"
    }
}
