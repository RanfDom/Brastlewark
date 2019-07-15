//
//  GnomeViewCell.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/11/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class GnomeViewCell: UITableViewCell {
  
  static let identifier = "GnomeViewCell"

  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  
  override func prepareForReuse() {
    super.prepareForReuse()
    profileImage.image = nil
    nameLabel.text = nil
    ageLabel.text = nil
  }

  func configure(with model: GnomeCardModel) {
    nameLabel.text = "Name: \n \(model.name)"
    ageLabel.text = "Age: \(model.age)"
    profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
    profileImage.clipsToBounds = true
    profileImage.contentMode = UIView.ContentMode.scaleAspectFit
    profileImage.sd_setImage(with: model.thumbnail, completed: nil)
  }
}
