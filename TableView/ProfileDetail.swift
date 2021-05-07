
import Foundation
import UIKit

class ProfileDetail: UIViewController
{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var expertLbl: UILabel!
    @IBOutlet weak var teamLbl: UILabel!
    @IBOutlet weak var shiftLbl: UILabel!
    
    
    var selectedShape : member!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameLbl.text = selectedShape.Name
        expertLbl.text = selectedShape.Expertise
        teamLbl.text = selectedShape.Team
        shiftLbl.text = selectedShape.Shift
        imageView.image = UIImage(named: selectedShape.Photo)
    }
}
