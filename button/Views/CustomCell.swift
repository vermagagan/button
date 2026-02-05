import UIKit

class CustomCell: UITableViewCell {
    
    let fruitLabel = UILabel()
    let actionButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        fruitLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(actionButton)
        contentView.addSubview(fruitLabel)
        
        actionButton.setTitle("Tap", for: .normal)
        actionButton.setTitleColor(.green, for: .normal)
        
        NSLayoutConstraint.activate([
            fruitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            fruitLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            actionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }

}
