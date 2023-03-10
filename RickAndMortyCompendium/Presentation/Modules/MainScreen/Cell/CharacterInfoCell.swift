//
//  CharacterInfoCell.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 24/1/23.
//

import UIKit

class CharacterInfoCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var moreInfoView: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    // MARK: - Overridden Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        cardView.setCorners(radius: 4)
        moreInfoView.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if moreInfoView.isHidden && selected {
            moreInfoView.isHidden = !selected
        } else if !moreInfoView.isHidden && selected {
            moreInfoView.isHidden = selected
        }
    }
    
    // MARK: - Internal Methods
    
    internal func bind(withModel model: CharacterInfoCellViewModel) {
        characterImageView.loadImageUsingCacheWithURLString(model.characterImageURL)
        nameLabel.text = String(format: "character_name".localized, model.name)
        genderLabel.text = String(format: "character_gender".localized, model.gender)
        speciesLabel.text = String(format: "character_species".localized, model.species)
        statusLabel.text = String(format: "character_status".localized, model.status)
        idLabel.text = String(format: "character_id".localized, "\(model.id)")
        typeLabel.text = String(format: "character_type".localized, model.type)
        originLabel.text = String(format: "character_origin".localized, model.origin)
        currentLocationLabel.text = String(format: "character_actualLocation".localized, model.currentLocation)
    }
    
}
