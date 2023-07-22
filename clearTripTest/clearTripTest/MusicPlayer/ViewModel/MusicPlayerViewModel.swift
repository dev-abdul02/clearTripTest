//
//  MusicPlayerViewModel.swift
//  clearTripTest
//
//  Created by abdul karim on 22/07/23.
//

import Foundation

class MusicPlayerViewModel {
    
    var tracks:[MusicListModel]?
    var currentPlayingIndex:Int = 0
    
    init(musicTrack:[MusicListModel], playingIndex:Int) {
        tracks = musicTrack
        currentPlayingIndex = playingIndex
    }
    
    func getCurrentTrack() -> MusicListModel? {
        if let track = tracks?[currentPlayingIndex] {
            return track
        }
        return nil
    }
}
