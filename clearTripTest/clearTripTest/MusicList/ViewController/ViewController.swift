//
//  ViewController.swift
//  clearTripTest
//
//  Created by abdul karim on 22/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tvTableView:UITableView! {
        didSet {
            tvTableView.dataSource = self
            tvTableView.delegate = self
        }
    }
    
    var viewModel: MusicListViewModel = MusicListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "MusicListTableViewCell", bundle: nil)
        tvTableView.register(nib, forCellReuseIdentifier: "MusicListcCell")
        tvTableView.reloadData()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.musicListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let musicListCell = tableView.dequeueReusableCell(withIdentifier: "MusicListcCell") as? MusicListTableViewCell
        let musicListObj = viewModel.musicListModel[indexPath.row]
        musicListCell?.configureView(data: musicListObj)
        return musicListCell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //navigate to music list
        
        let musicPlayer = MusicPlayer()
        let selctedTrack = viewModel.musicListModel[indexPath.row]
        let vieModel = MusicPlayerViewModel(musicTrack: selctedTrack)
        musicPlayer.viewModel = vieModel
        self.present(musicPlayer, animated: true)
    }
    
    
}

