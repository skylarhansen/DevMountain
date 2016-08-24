//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Jairo Eli de Leon on 8/17/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
  
  
  @IBOutlet weak var playlistTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.tableView.reloadData()
  }
  
  
  @IBAction func addButtonTapped(_ sender: AnyObject) {
    
    if let name = playlistTextField.text, name.characters.count > 0 {
      PlaylistController.sharedController.addPlaylist(name: name)
      playlistTextField.text = ""
      self.tableView.reloadData()
    }
    
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return PlaylistController.sharedController.playlists.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
    
    let playlist = PlaylistController.sharedController.playlists[indexPath.row]
    
    cell.textLabel?.text = playlist.name
    cell.detailTextLabel?.text = "\(playlist.songs.count) songs"
    
    return cell
    
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      let playlist = PlaylistController.sharedController.playlists[indexPath.row]
      PlaylistController.sharedController.deletePlaylist(playlist: playlist)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
  }
  

   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "toPlaylistDetail", let indexPath = tableView.indexPathForSelectedRow {
      
      let playlist = PlaylistController.sharedController.playlists[indexPath.row]
      
      let songVC = segue.destination as? SongTableViewController
      songVC?.playlist = playlist
      
    }
    
   }

  
}
