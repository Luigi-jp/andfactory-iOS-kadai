//
//  UserCell.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/13.
//

import UIKit

final class UserCell: UITableViewCell {
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        nameLabel.text = nil
        typeLabel.text = nil
    }

    func configure(item: User) {
        iconImageView.loadImage(with: item.avatarUrlStr)
        nameLabel.text = item.login
        typeLabel.text = item.type
    }
}
