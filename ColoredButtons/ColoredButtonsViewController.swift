import UIKit

class ColoredButtonsViewController: UIViewController {
    var direction = Direction.clockwise
    var topLefSquare = ColoredSquare(location: .topLeft, isToggled: false)
    var topRightSquare = ColoredSquare(location: .topRight, isToggled: false)
    var bottomLeftSquare = ColoredSquare(location: .bottomLeft, isToggled: false)
    var bottomRightSquare = ColoredSquare(location: .bottomRight, isToggled: false)
    
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var directionLabel: UILabel!

    @IBAction func didTapTopLeftButton(_ sender: Any) {
        let nextLocation = topLefSquare.nextLocation(following: direction)
        square(at: nextLocation).toggle()
        updateUI()
    }
    @IBAction func didTapTopRightButton(_ sender: Any) {
        let nextLocation = topRightSquare.nextLocation(following: direction)
        square(at: nextLocation).toggle()
        updateUI()
    }
    @IBAction func didTapBottomLeftButton(_ sender: Any) {
        let nextLocation = bottomLeftSquare.nextLocation(following: direction)
        square(at: nextLocation).toggle()
        updateUI()
    }
    @IBAction func didTapBottomRightButton(_ sender: Any) {
        let nextLocation = bottomRightSquare.nextLocation(following: direction)
        square(at: nextLocation).toggle()
        updateUI()
    }
    
    @IBAction func changeDirection(_ sender: Any) {
        direction = direction.toggled()
        updateUI()
    }
    
    func square(at location: ColoredSquareLocation) -> ColoredSquare {
        switch location {
            case .topLeft:
                return topLefSquare
            case .topRight:
                return topRightSquare
            case .bottomLeft:
                return bottomLeftSquare
            case .bottomRight:
                return bottomRightSquare
        }
    }
    
    func updateUI(){
        topLeftButton.backgroundColor = topLefSquare.color
        topRightButton.backgroundColor = topRightSquare.color
        bottomLeftButton.backgroundColor = bottomLeftSquare.color
        bottomRightButton.backgroundColor = bottomRightSquare.color

        switch direction {
        case .clockwise:
            directionLabel.text = "Go clockwise"
        case .counterClockwise:
            directionLabel.text = "Go counterclockwise"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
}


