//
//  GnomeViewCell.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/11/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import UIKit

class GnomeViewCell: UITableViewCell {
  
  static let reusableId = "GnomeViewCell"

  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  func configure(with model: GnomeCardModel) {
    self.nameLabel.text = "Name: \(model.name)"
    self.ageLabel.text = "Age: \(model.age)"
  }
}
