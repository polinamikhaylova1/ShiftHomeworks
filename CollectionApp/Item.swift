import UIKit


class Item {
    var imageName: String
    var labelText: String
    var descriptionText: String
    
    init(imageName: String, labelText: String, descriptionText: String) {
        self.imageName = imageName
        self.labelText = labelText
        self.descriptionText = descriptionText
    }
}
