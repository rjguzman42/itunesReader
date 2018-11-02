//
//  VerticalMediaTableCell.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/2/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

class VerticalMediaTableCell: UITableViewCell {
    
    lazy var mediaImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width / 4, height: (self.frame.size.width / 4) * 1.48))
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = Theme.Colors.hintGray.color
        return view
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.Colors.primaryText.color
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        reset()
    }
    
    func reset() {
        mediaImageView.image = nil
        nameLabel.text = ""
    }
    
    
    //MARK: UI
    
    func setupSubViews() {
        addSubview(mediaImageView)
        addConstraintsWithFormat(format: "H:|-5-[v0(\(mediaImageView.frame.size.width))]", views: mediaImageView)
        addConstraintsWithFormat(format: "V:|-5-[v0(\((mediaImageView.frame.size.height)))]-5-|", views: mediaImageView)
        
        addSubview(nameLabel)
        addConstraintsWithFormat(format: "H:[v1]-5-[v0]-10-|", views: nameLabel, mediaImageView)
        addConstraintsWithFormat(format: "V:|-10-[v0]-5-|", views: mediaImageView)
    }
}
