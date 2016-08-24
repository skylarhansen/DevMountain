//
//  Song.swift
//  Playlist
//
//  Created by Jairo Eli de Leon on 8/17/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class Song: Equatable {
  
  private let nameKey = "name"
  private let artistKey = "artist"
  
  let name: String
  let artist: String
  
  init(name: String, artist: String) {
    self.name = name
    self.artist = artist
  }
  
  // turn song into dictionary to be saved in nsuserdefault
  
  var dictionaryRepresentation: [String: AnyObject] {
    return [nameKey: self.name as AnyObject, artistKey: self.artist as AnyObject]
  }
  
}

func ==(lhs: Song, rhs: Song) -> Bool {
  return lhs.name == rhs.name && lhs.artist == rhs.artist
}
