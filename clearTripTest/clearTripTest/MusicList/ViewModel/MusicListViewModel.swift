//
//  MusicListViewModel.swift
//  clearTripTest
//
//  Created by abdul karim on 22/07/23.
//

import Foundation

class MusicListViewModel {
    
    var musicListModel = [MusicListModel]()
    
    init() {
        addData()
    }
    
    func addData() {
        let obj1 = MusicListModel(title: "Bad Blood", artist: "Taylor Swift", album: "dummyImage", duration: "2 min", url: "www.example.com/data1.mp3")
        let obj2 = MusicListModel(title: "Firework", artist: "Katy Perry", album: "dummyImage", duration: "5 min", url: "www.example.com/data2.mp3")
        let obj3 = MusicListModel(title: "Bad Blood", artist: "Taylor Swift", album: "dummyImage", duration: "2min", url: "www.example.com/data3.mp3")
        let obj4 = MusicListModel(title: "Bad Blood", artist: "Taylor Swift", album: "dummyImage", duration: "2min", url: "www.example.com/data4.mp3")
        
        musicListModel.append(obj1)
        musicListModel.append(obj2)
        musicListModel.append(obj3)
        musicListModel.append(obj4)
    }
    
}
