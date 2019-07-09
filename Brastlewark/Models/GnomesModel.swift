//
//  GnomesModel.swift
//  Brastlewark
//
//  Created by RanfeDom on 7/8/19.
//  Copyright © 2019 Ranfelabs. All rights reserved.
//

import Foundation

// MARK: - Brastlewark Decodable

struct GnomesApiResponse {
  let gnomes: [Gnome]
}

extension GnomesApiResponse: Decodable {
  private enum GnomesApiResponseCodingKeys: String, CodingKey {
    case gnomes = "Brastlewark"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: GnomesApiResponseCodingKeys.self)
    gnomes = try container.decode([Gnome].self, forKey: .gnomes)
  }
}

// MARK: - Gnome Decodable

struct Gnome {
  let id: Int
  let age: Int
  let friends: [Gnome]
  let hairColor: String
  let height: Float
  let weight: Float
  let name: String
  let professions: [Profession]
  let thumbnail: String
}

extension Gnome: Decodable {
  private enum GnomeCodingKeys: String, CodingKey {
    case id
    case age = "age"
    case friends = "friends"
    case hairColor = "hair_color"
    case height = "height"
    case weight = "weight"
    case name = "name"
    case professions = "professions"
    case thumbnail = "thumbnail"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: GnomeCodingKeys.self)
   id = try container.decode(Int.self, forKey: .id)
   age = try container.decode(Int.self, forKey: .age)
   friends = try container.decode([Gnome].self, forKey: .friends)
   hairColor = try container.decode(String.self, forKey: .hairColor)
   height = try container.decode(Float.self, forKey: .height)
   weight = try container.decode(Float.self, forKey: .weight)
   name = try container.decode(String.self, forKey: .name)
   professions = try container.decode([Profession].self, forKey: .professions)
   thumbnail = try container.decode(String.self, forKey: .thumbnail)
  }
}

// MARK: - Profession Decodable

struct Profession {
  let title: String
}

extension Profession: Decodable {
  enum ProfessionCodingKeys: String, CodingKey {
    case title
  }
  
  init(from decoder: Decoder) throws {
    let jobContainer = try decoder.container(keyedBy: ProfessionCodingKeys.self)
    title = try jobContainer.decode(String.self, forKey: .title)
  }
}
