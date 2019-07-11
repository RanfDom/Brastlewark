//
//  GnomeViewModel.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/11/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

struct GnomeViewModel {
  let id: Int
  let name: String
  let age: Int
  let hairColor: String
  let height: Float
  let weight: Float
  let thumbnail: String
}

extension GnomeViewModel {
  init(_ model: Gnome) {
    self.id = model.id
    self.name = model.name
    self.age = model.age
    self.hairColor = model.hairColor
    self.height = model.height
    self.weight = model.weight
    self.thumbnail = model.thumbnail
  }
}
