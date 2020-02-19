
import Foundation
import UIKit.UIColor

enum ColoredSquareLocation {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

enum Direction {
    case clockwise
    case counterClockwise
    
    func toggled() -> Direction {
        switch self {
        case .clockwise:
            return .counterClockwise
        case .counterClockwise:
            return .clockwise
        }
    }
}

class ColoredSquare {
    private let location: ColoredSquareLocation
    private var isToggled: Bool
    
    init(location: ColoredSquareLocation, isToggled: Bool) {
        self.location = location
        self.isToggled = isToggled
    }
    
    func toggle() {
        isToggled.toggle()
    }
    
    var color: UIColor {
        switch location {
        case .topLeft:
            return isToggled ? UIColor.purple : UIColor.cyan
        case .topRight:
            return isToggled ? UIColor.green : UIColor.orange
        case .bottomLeft:
            return isToggled ? UIColor.brown : UIColor.blue
        case .bottomRight:
            return isToggled ? UIColor.red : UIColor.black
        }
    }
    
    func nextLocation(following direction: Direction) -> ColoredSquareLocation  {
        switch self.location {
            case .topLeft:
                return direction == .clockwise ? .topRight : .bottomLeft
            case .topRight:
                return direction == .clockwise ? .bottomRight : .topLeft
            case .bottomLeft:
                return direction == .clockwise ? .topLeft : .bottomRight
            case .bottomRight:
                return direction == .clockwise ? .bottomLeft : .topRight
        }
    }
}
