//
//  Playlist.swift
//  Playlist
//
//  Created by Jairo Eli de Leon on 8/17/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import Foundation

class Playlist: Equatable {
  
  private let nameKey = "name"
  private let songKey = "song"
  
  let name: String
  var songs: [Song]
  
  init(name: String, songs: [Song] = []) {
    self.name = name
    self.songs = songs
  }
  
  var dictionaryRepresentation: [String: AnyObject] {
    return [nameKey: self.name as AnyObject, songKey: self.songs.map({$0.dictionaryRepresentation})]
  }
  
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
  return lhs.name == rhs.name && lhs.songs == rhs.songs
}
