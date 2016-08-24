//
//  SongController.swift
//  Playlist
//
//  Created by Jairo Eli de Leon on 8/17/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import Foundation

class SongController {
  
  static let sharedController = SongController()
  
  func createSong(name: String, artist: String, playlist: Playlist) {
    let song = Song(name: name, artist: artist)
    addSongToPlaylist(song: song, playlist: playlist)
  }
  
  func addSongToPlaylist(song: Song, playlist: Playlist) {
    playlist.songs.append(song)
  }
  
  func removeSongFromPlaylist(song: Song, playlist: Playlist) {
    
    if let index = playlist.songs.index(of: song) {
      playlist.songs.remove(at: index)
    }
    
  }
  
  
  
}
