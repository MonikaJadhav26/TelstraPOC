//
//  FactsTableViewCell.swift
//  TelstraDemo
//
//  Created by Monika Jadhav on 05/05/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import UIKit

class FactsTableViewCell: UITableViewCell {

    //MARK: - Outlets

    let titleImageView:UIImageView = {
        let img = UIImageView()
        img.image = defaultImage
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.clipsToBounds = true
        return img
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: CGFloat(boldFontConstant))
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: CGFloat(regularFontConstant))
        label.textColor =  .black
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

     //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        titleImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: CGFloat(kTopBottomRightLeftPaddingConstant), paddingLeft: CGFloat(kTopBottomRightLeftPaddingConstant), paddingBottom: CGFloat(kTopBottomRightLeftPaddingConstant), paddingRight: 0, width: CGFloat(imageViewHeightWidthConstant), height: CGFloat(imageViewHeightWidthConstant), enableInsets: false)
        titleLabel.anchor(top: topAnchor, left: titleImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: CGFloat(kTopBottomRightLeftPaddingConstant), paddingLeft: CGFloat(kTopBottomRightLeftPaddingConstant), paddingBottom: CGFloat(kTopBottomRightLeftPaddingConstant), paddingRight: CGFloat(kTopBottomRightLeftPaddingConstant), width: frame.size.width, height: 0, enableInsets: false)
        descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(labelHeightConstant)).isActive = true
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: titleImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: CGFloat(kTopBottomRightLeftPaddingConstant), paddingLeft: CGFloat(kTopBottomRightLeftPaddingConstant), paddingBottom: CGFloat(kTopBottomRightLeftPaddingConstant), paddingRight: CGFloat(kTopBottomRightLeftPaddingConstant), width: frame.size.width, height: 0, enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //MARK: - Configure cell UI
    func configureTableViewCell() {
        
    }
    
   

}
