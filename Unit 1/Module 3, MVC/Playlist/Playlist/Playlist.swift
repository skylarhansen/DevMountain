//
//  Playlist.swift
//  Playlist
//
//  Created by Spencer Curtis on 8/17/16.
//  Copyright © 2016 Spencer Curtis. All rights reserved.
//

import Foundation

class Playlist: Equatable {
  
  private let kName = "name"
  private let kSongs = "songs"
  
  let name: String
  var songs: [Song]
  
  init(name: String, songs: [Song] = []) {
    self.name = name
    self.songs = songs
  }
  
  var dictionaryRepresentation: [String: AnyObject] {
    return [kName: self.name, kSongs: self.songs.map({$0.dictionaryRepresentation})]
  }
  
  init?(dictionary: [String: AnyObject]) {
    guard let name = dictionary[kName] as? String, let songsDicitonaryArray = dictionary[kSongs] as? [[String: AnyObject]] else { return nil }
    
    self.name = name
    self.songs = songsDicitonaryArray.flatMap({ Song(dictionary: $0)})
    
  }
  
  
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
  return lhs.name == rhs.name && lhs.songs == rhs.songs
}
