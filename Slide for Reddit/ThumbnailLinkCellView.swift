//
//  ThumbnailLinkCellView
//  Slide for Reddit
//
//  Created by Carlos Crane on 6/25/17.
//  Copyright © 2017 Haptic Apps. All rights reserved.
//

import Anchorage
import UIKit

final class ThumbnailLinkCellView: LinkCellView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

    override func layoutForType() {
        super.layoutForType()
        constraintsForType = batch {
            thumbImageContainer.isHidden = false
            let ceight = SettingValues.postViewMode == .COMPACT ? CGFloat(4) : CGFloat(8)
            let ctwelve = SettingValues.postViewMode == .COMPACT ? CGFloat(8) : CGFloat(12)
            if !SettingValues.actionBarMode.isFull() {
                thumbImageContainer.bottomAnchor <= innerView.bottomAnchor - ctwelve
            } else {
                thumbImageContainer.bottomAnchor <= box.topAnchor - ceight
            }

            // Thumbnail sizing
            thumbImageContainer.topAnchor == innerView.topAnchor + ctwelve
            if SettingValues.leftThumbnail {
                if SettingValues.actionBarMode == .SIDE {
                    thumbImageContainer.leftAnchor == sideButtons.rightAnchor + ceight
                } else {
                    thumbImageContainer.leftAnchor == innerView.leftAnchor + ctwelve
                }
            } else {
                if SettingValues.actionBarMode == .SIDE_RIGHT {
                    thumbImageContainer.rightAnchor == sideButtons.leftAnchor - ceight
                } else {
                    thumbImageContainer.rightAnchor == innerView.rightAnchor - ctwelve
                }
            }

            let thumbSize: CGFloat = (SettingValues.largerThumbnail ? 75 : 50) - (SettingValues.postViewMode == .COMPACT ? 15 : 0)
            thumbImageContainer.widthAnchor == thumbSize
            thumbImageContainer.heightAnchor == thumbSize
            if SettingValues.actionBarMode == .SIDE {
                sideButtons.topAnchor == innerView.topAnchor + ctwelve
                title.leftAnchor == (SettingValues.leftThumbnail ? thumbImageContainer.rightAnchor + ceight : sideButtons.rightAnchor + ceight)
                title.rightAnchor == (SettingValues.leftThumbnail ? innerView.rightAnchor - ctwelve : thumbImageContainer.leftAnchor - ceight)
            } else if SettingValues.actionBarMode == .SIDE_RIGHT {
                sideButtons.topAnchor == innerView.topAnchor + ctwelve
                title.leftAnchor == (SettingValues.leftThumbnail ? thumbImageContainer.rightAnchor + ceight : innerView.leftAnchor + ctwelve)
                title.rightAnchor == (SettingValues.leftThumbnail ? sideButtons.leftAnchor - ceight : thumbImageContainer.leftAnchor - ceight)
            } else {
                title.leftAnchor == (SettingValues.leftThumbnail ? thumbImageContainer.rightAnchor + ceight : innerView.leftAnchor + ctwelve)
                title.rightAnchor == (SettingValues.leftThumbnail ? innerView.rightAnchor - ctwelve : thumbImageContainer.leftAnchor - ceight)
            }
            title.topAnchor == innerView.topAnchor + (ctwelve - 5)
            if !SettingValues.actionBarMode.isFull() {
                title.bottomAnchor <= innerView.bottomAnchor - ceight
            } else {
                title.bottomAnchor >= box.topAnchor - ceight
            }
            
            subicon.topAnchor == title.topAnchor
            subicon.leftAnchor == title.leftAnchor
            subicon.widthAnchor == 24
            subicon.heightAnchor == 24
        }
    }

    override func layoutForContent() {
        
    }
    
//    override func doConstraints() {
//        let target = CurrentType.thumb
//                
//        if(currentType == target && target != .banner){
//            return //work is already done
//        } else if(currentType == target && target == .banner && bigConstraint != nil){
//            self.innerView.addConstraint(bigConstraint!)
//            return
//        }
//        
//        let metrics=["horizontalMargin":75,"top":0,"bottom":0,"separationBetweenLabels":0,"size": full ? 16 : 8, "labelMinHeight":75,  "ctwelve": SettingValues.postViewMode == .COMPACT ? 8 : 12,"ceight": SettingValues.postViewMode == .COMPACT ? 4 : 8,"thumb": (SettingValues.largerThumbnail ? 75 : 50), "bannerHeight": submissionHeight] as [String: Int]
//        let views=["label":title, "body": textView, "image": thumbImage, "info": b, "upvote": upvote, "downvote" : downvote, "score": score, "comments": comments, "banner": bannerImage, "buttons":buttons, "box": box] as [String : Any]
//        var bt = "(ceight)-[buttons]-(ceight)-"
//        var bx = "(ceight)-[box]-(ceight)-"
//        if(SettingValues.hideButtonActionbar && !full){
//            bt = "(ceight)-[buttons(0)]-"
//            bx = "(ceight)-[box(0)]-"
//        }
//        
//        self.innerView.removeConstraints(thumbConstraint)
//        thumbConstraint = []
//        
//            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-(ceight)-[image(thumb)]",
//                                                                              options: NSLayoutFormatOptions(rawValue: 0),
//                                                                              metrics: metrics,
//                                                                              views: views))
//            if(SettingValues.leftThumbnail){
//                thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-(ceight)-[image(thumb)]-(ceight)-[label]-(ctwelve)-|",
//                                                                                  options: NSLayoutFormatOptions(rawValue: 0),
//                                                                                  metrics: metrics,
//                                                                                  views: views))
//            } else {
//            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-(ctwelve)-[label]-(ceight)-[image(thumb)]-(ceight)-|",
//                                                                              options: NSLayoutFormatOptions(rawValue: 0),
//                                                                              metrics: metrics,
//                                                                              views: views))
//            }
//            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-(ceight)-[label]-\(bx)|",
//                options: NSLayoutFormatOptions(rawValue: 0),
//                metrics: metrics,
//                views: views))
//            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-(ceight)-[label]-\(bt)|",
//            options: NSLayoutFormatOptions(rawValue: 0),
//            metrics: metrics,
//            views: views))
//
//        self.innerView.addConstraints(thumbConstraint)
//        if(target == .banner && bigConstraint != nil){
//            self.innerView.addConstraint(bigConstraint!)
//            return
//        }
//        currentType = target
//    }
    
}
