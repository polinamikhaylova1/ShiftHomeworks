struct ItemViewModel {
    let imageName: String
    let labelText: String
    let descriptionText: String
    
    init(from item: Item) {
        self.imageName = item.imageName
        self.labelText = item.labelText
        self.descriptionText = item.descriptionText
    }
}
