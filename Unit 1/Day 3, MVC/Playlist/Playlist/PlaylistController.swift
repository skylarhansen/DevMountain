//
//  PlaylistController.swift
//  Playlist
//
//  Created by Spencer Curtis on 8/17/16.
//  Copyright © 2016 Spencer Curtis. All rights reserved.
//

import Foundation

class PlaylistController {
  
  private let kPlaylists = "storedPlaylists"
  
  static let sharedController = PlaylistController()
  
  var playlists: [Playlist] = []
  
  init() {
    loadFromPersistentStore()
  }
  
  func addPlaylist(name: String) {
    let playlist = Playlist(name: name)
    playlists.append(playlist)
    saveToPersistentStore()
  }
  
  func deletePlaylist(playlist: Playlist) {
    if let index = playlists.indexOf(playlist) {
      playlists.removeAtIndex(index)
      saveToPersistentStore()
    }
  }
  
  func saveToPersistentStore() {
    NSUserDefaults.standardUserDefaults().setObject(playlists.map({$0.dictionaryRepresentation}), forKey: kPlaylists)
  }
  
  func loadFromPersistentStore() {
    guard let playlistsDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kPlaylists) as? [[String: AnyObject]] else { return }
    playlists = playlistsDictionaryArray.flatMap({Playlist(dictionary: $0)})
  }
  
  
}
