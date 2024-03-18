//
//  AutoResizingTableView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/16.
//

import UIKit

class AutoResizingTableView : UITableView {
    
    override public func layoutSubviews() {
        print("AutoResizingTableView intrinsicContentSize --> ", intrinsicContentSize)
        print("AutoResizingTableView bounds.size --> ", bounds.size)
        
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return contentSize
    }
}
