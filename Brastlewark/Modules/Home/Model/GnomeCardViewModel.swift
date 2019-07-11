//
//  GnomeCardViewModel.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/11/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

struct GnomeCardModel {
  let name: String
  let age: Int
  let hairColor: String
  let height: Float
  let weight: Float
  let thumbnail: URL?
}

extension GnomeCardModel {
  init(_ model: GnomeViewModel) {
    self.name = model.name
    self.age = model.age
    self.hairColor = model.hairColor
    self.height = model.height
    self.weight = model.weight
    self.thumbnail = URL(string: model.thumbnail)
  }
}
