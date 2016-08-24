//
//  PlaylistControler.swift
//  Playlist
//
//  Created by Jairo Eli de Leon on 8/17/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import Foundation

class PlaylistController {
  
  static let sharedController = PlaylistController()
  
  var playlists: [Playlist] = []
  
  func addPlaylist(name: String) {
    let playlist = Playlist(name: name)
    playlists.append(playlist)
  }
  
  func deletePlaylist(playlist: Playlist) {
    
    if let index = playlists.index(of: playlist) {
      playlists.remove(at: index)
    }

  }
  
  
}
