import Foundation

var state = State(dimention: 40)

while true {
    print("\u{001B}[2J")
    print(state)
    state = nextState(from: state)
    usleep(300000)
}
