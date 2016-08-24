//
//  SongController.swift
//  Playlist
//
//  Created by Spencer Curtis on 8/17/16.
//  Copyright © 2016 Spencer Curtis. All rights reserved.
//

import Foundation

class SongController {
  
  static let sharedController = SongController()
  
  func createSong(name: String, artist: String, playlist: Playlist) {
    let song = Song(name: name, artist: artist)
    addSongToPlaylist(song, playlist: playlist)
    PlaylistController.sharedController.saveToPersistentStore()
  }
  
  func addSongToPlaylist(song: Song, playlist: Playlist) {
    playlist.songs.append(song)
  }
  
  func removeSongFromPlaylist(song: Song, playlist: Playlist) {
    if let index = playlist.songs.indexOf(song) {
      playlist.songs.removeAtIndex(index)
      PlaylistController.sharedController.saveToPersistentStore()
    }
  }
}
