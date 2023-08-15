//
//  HomeCell.swift
//  MVVM-WhitehousePetition-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 14.08.2023.
//

import UIKit

final class HomeCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(model: PetitionResults?) {
        titleLabel.text = model?.title
        detailLabel.text = model?.body
    }
}
