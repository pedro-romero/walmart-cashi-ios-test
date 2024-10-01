//
//  ProductTableViewCell.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

import UIKit

final class ProductTableViewCell: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(product: Product) {
        var config = defaultContentConfiguration()
        config.text = product.name
        config.secondaryText = "\(product.price)"
        contentConfiguration = config
    }
}
