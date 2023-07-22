//
//  MusicPlayer.swift
//  clearTripTest
//
//  Created by abdul karim on 22/07/23.
//

import UIKit
import AVFoundation

class MusicPlayer: UIViewController {

    @IBOutlet weak var lMusicSubtitleLabel: UILabel!
    @IBOutlet weak var lMusicTitleLabel: UILabel!
    
    @IBOutlet weak var bCloseButton: UIButton!
    @IBOutlet weak var bNextButton: UIButton!
    @IBOutlet weak var bPlayButton: UIButton!
    @IBOutlet weak var bPreviousButton: UIButton!
    
    @IBOutlet weak var sVolumeSlider: UISlider!
    @IBOutlet weak var ivMusicImageView: UIImageView!
    
    var viewModel:MusicPlayerViewModel?
    var audioPlayer:AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        addTargets()
        setupAudioPlayer()
    }
    
    fileprivate func configureUI() {
        if let currentPlayingData = viewModel?.tracks?[viewModel?.currentPlayingIndex ?? 0] {
             let imagename = currentPlayingData.album
             ivMusicImageView.image = UIImage(named: imagename)
            

            lMusicTitleLabel.text = currentPlayingData.title
            lMusicSubtitleLabel.text = currentPlayingData.artist
        }

        
        sVolumeSlider.minimumValue = 0
        sVolumeSlider.maximumValue = 10
    }
    

    



}
//MARK: Audio Player setup and action
extension MusicPlayer {
    fileprivate func setupAudioPlayer() {
        guard let audioURL = Bundle.main.url(forResource: "dummyMp3", withExtension: "mp3") else {
            print("Audio file not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            playAudio()
            
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
    }
    
    fileprivate func playAudio() {
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
        bPlayButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }
    
    fileprivate func pauseAudio() {
        audioPlayer?.pause()
        bPlayButton.setImage(UIImage(systemName: "play.fill") , for: .normal)
    }
    
    fileprivate func stopAndReset() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
}

//MARK: Actions and Targets
extension MusicPlayer {
    fileprivate func addTargets() {
        bCloseButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        bNextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        bPlayButton.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        bPreviousButton.addTarget(self, action: #selector(previousButtonAction), for: .touchUpInside)
        sVolumeSlider.addTarget(self, action: #selector(sliderAction), for: .touchUpInside)
    }
    
    @objc func closeButtonAction(_ sender: UIButton?) {
        stopAndReset()
        self.dismiss(animated: true)
    }
    
    @objc func sliderAction(_ sender: UISlider?) {
        let sliderValue = sender?.value
        audioPlayer?.volume = sliderValue ?? 5.0
    }
    
    @objc func nextButtonAction(_ sender: UIButton?) {
        //todo manage out of index
        stopAndReset()
        let currentIndex =  viewModel?.currentPlayingIndex ?? 0
        viewModel?.currentPlayingIndex = (currentIndex ) + 1
        configureUI()
        setupAudioPlayer()
    }
    
    @objc func previousButtonAction(_ sender: UIButton?) {
        //todo manage negative
        stopAndReset()
        let currentIndex =  viewModel?.currentPlayingIndex ?? 0
        viewModel?.currentPlayingIndex = currentIndex - 1
        configureUI()
        setupAudioPlayer()
    }
    
    
    @objc func playButtonAction(_ sender: UIButton?) {
        if let audioPlayer = audioPlayer {
            if audioPlayer.isPlaying {
                pauseAudio()
            }
            else {
                //pause
                playAudio()
            }
        }
        
    }
}
