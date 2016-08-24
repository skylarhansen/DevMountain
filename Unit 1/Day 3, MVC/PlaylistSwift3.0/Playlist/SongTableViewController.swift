//
//  SongTableViewController.swift
//  Playlist
//
//  Created by Jairo Eli de Leon on 8/17/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
  
  var playlist: Playlist?
  
  @IBOutlet weak var songTextField: UITextField!
  @IBOutlet weak var songArtistTextField: UITextField!
  

    override func viewDidLoad() {
        super.viewDidLoad()

    }

  @IBAction func addSongButton(_ sender: AnyObject) {
    
    if let name = songTextField.text, let artist = songArtistTextField.text, let playlist = self.playlist {
      SongController.sharedController.createSong(name: name, artist: artist, playlist: playlist)
      self.tableView.reloadData()
    }
    
  }
  
  // MARK: - Table view data source
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if let count = playlist?.songs.count {
      return count
    } else {
      return 0
    }
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
    
    let song = playlist?.songs[indexPath.row]
    cell.detailTextLabel?.text = song?.artist
    
    return cell
    
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      
      if let playlist = playlist {
        
        let song = playlist.songs[indexPath.row]
        
        SongController.sharedController.removeSongFromPlaylist(song: song, playlist: playlist)
      }
      
      
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
  }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
