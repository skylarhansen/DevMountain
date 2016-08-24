//
//  Song.swift
//  Playlist
//
//  Created by Spencer Curtis on 8/17/16.
//  Copyright © 2016 Spencer Curtis. All rights reserved.
//

import Foundation

class Song: Equatable {
  
  private let kName = "name"
  private let kArtist = "artist"
  
  let name: String
  let artist: String
  
  init(name: String, artist: String) {
    self.name = name
    self.artist = artist
  }
  
  // Turn Song into a dictionary to be saved in NSUserDefaults
  
  var dictionaryRepresentation: [String: AnyObject] {
    return [kName: self.name, kArtist: self.artist]
  }
  
  init?(dictionary: [String: AnyObject]) {
    guard let name = dictionary[kName] as? String, let artist = dictionary[kArtist] as? String else {
      return nil
    }
    
    self.name = name
    self.artist = artist

  }
  
  
  
}

func ==(lhs: Song, rhs: Song) -> Bool {
  return lhs.name == rhs.name && lhs.artist == rhs.artist
}
