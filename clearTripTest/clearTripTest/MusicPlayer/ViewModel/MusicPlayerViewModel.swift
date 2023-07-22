//
//  MusicPlayerViewModel.swift
//  clearTripTest
//
//  Created by abdul karim on 22/07/23.
//

import Foundation

class MusicPlayerViewModel {
    
    var currentTrack:MusicListModel?
    
    init(musicTrack:MusicListModel) {
        currentTrack = musicTrack
    }
}
