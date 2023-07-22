//
//  MusicListTableViewCell.swift
//  clearTripTest
//
//  Created by abdul karim on 22/07/23.
//

import UIKit

class MusicListTableViewCell: UITableViewCell {

    @IBOutlet weak var lCaptionLabel: UILabel!
    @IBOutlet weak var lSubTitleLabel: UILabel!
    @IBOutlet weak var lTitleLabel: UILabel!
    @IBOutlet weak var ivImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView(data:MusicListModel) {
        ivImageView.image = UIImage(named: data.album)
        lTitleLabel.text = data.title
        lSubTitleLabel.text = data.artist
        lCaptionLabel.text = data.duration
    }
    
}
