//
//  DHSegmentedControl.swift
//  DKSegmentSample
//
//  Created by Dinesh Kumar on 28/01/17.
//  Copyright © 2017 Infoedge. All rights reserved.
//

import UIKit

public protocol DHSemgentTitleContainable {
    var segmentTitle:String {get}
}

public class DHSegmentTitle:DHSemgentTitleContainable {
    public var segmentTitle: String
    public init(_ title:String) {
        segmentTitle = title
    }
}


let kHeightOfIndicator:CGFloat = 4.0
let kAnimationDuration = 0.2
let kBackAndForthAnimationDuration = 0.4
let kExtraSegmentPadding:CGFloat = 16.0
let kLeftRightInset:CGFloat = 16.0


public class DHSegmentedControl: UIControl {
    
    // Views
    private var scrollView: UIScrollView!
    private var selectionIndicatorView:UIView!
    private var segmentButtons:[UIButton] = []
    
    public var attributeFont: UIFont = UIFont.systemFont(ofSize: 12.0, weight: 3.0) {
        didSet {
            for button in segmentButtons {
                button.titleLabel?.font = attributeFont
            }
            updateFramesAndContentSize()
        }
    }
    public var attributeIndicatorColor: UIColor = UIColor.init(colorLiteralRed: 80/225, green: 227/255, blue: 197/255, alpha: 1.0) {
        didSet{
            selectionIndicatorView.backgroundColor = attributeIndicatorColor
        }
    }
    public var attributeFontColor = UIColor.white {
        didSet {
            for button in segmentButtons {
                button.setTitleColor(attributeFontColor, for: .normal)
            }
        }
    }
    public var attributeControlColor = UIColor.darkGray {
        didSet {
            scrollView.backgroundColor = attributeControlColor
        }
    }
    
    
    
    // Data
    private var items:[DHSemgentTitleContainable] = []
    public var selectedIndex:Int = 0
    
    
    // Methods
    public init(items:[DHSemgentTitleContainable]) {
        super.init(frame: CGRect.zero)
        self.items = items
        self.commonInit()
    }
    
    public func scrollBackAndForth() {
        UIView.animate(withDuration: kBackAndForthAnimationDuration, animations: {
            self.scrollView.contentOffset = CGPoint(x: self.scrollView.contentSize.width - self.scrollView.frame.size.width, y: self.scrollView.contentOffset.y)
        }) { (sucess) in
            UIView.animate(withDuration: kBackAndForthAnimationDuration, animations: {
                self.scrollView.contentOffset = CGPoint(x: 0, y: self.scrollView.contentOffset.y)
            })
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        setupScrollView()
        setupSegmentButtons()
        setupIndicatorView()
    }
    
    private func setupSegmentButtons() {
        for (index,element) in items.enumerated() {
            let button = UIButton.init(type: .custom)
            button.setTitleColor(attributeFontColor, for: .normal)
            button.titleLabel?.font = attributeFont
            button.setTitle(element.segmentTitle, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(segmentTapped(tappedButton:)), for: .touchUpInside)
            segmentButtons.append(button)
            scrollView.addSubview(button)
        }
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView(frame: self.bounds)
        scrollView.backgroundColor = attributeControlColor
        scrollView.contentInset = UIEdgeInsetsMake(0, kLeftRightInset, 0, kLeftRightInset)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.autoresizingMask = [.flexibleBottomMargin,.flexibleTopMargin,.flexibleHeight,.flexibleLeftMargin,.flexibleRightMargin,.flexibleWidth]
        addSubview(scrollView);
    }
    
    private func setupIndicatorView() {
        selectionIndicatorView = UIView()
        selectionIndicatorView.backgroundColor = attributeIndicatorColor
        scrollView.addSubview(selectionIndicatorView)
    }
    
    private func updateFramesAndContentSize() {
        scrollView.frame = bounds
        
        var sumOfButtonWidth: CGFloat = 0.0
        for button in segmentButtons {
            button.sizeToFit()
            let frame = CGRect(x: sumOfButtonWidth, y: 0, width: button.frame.size.width + kExtraSegmentPadding, height: bounds.size.height)
            button.frame = frame
            
            let index = segmentButtons.index(of:button)!
            if index == selectedIndex {
                var frame = button.frame
                frame.origin.y = bounds.size.height - kHeightOfIndicator
                frame.size.height = kHeightOfIndicator
                selectionIndicatorView.frame = frame
            }
            
            sumOfButtonWidth += button.frame.size.width
        }
        scrollView.contentSize = CGSize(width: sumOfButtonWidth, height: bounds.height)
    }
    
    private func postionIndicatorView(animated:Bool) {
        
        let selectedButton = segmentButtons[selectedIndex]
        var frame = selectedButton.frame
        frame.origin.y = bounds.size.height - kHeightOfIndicator
        frame.size.height = kHeightOfIndicator
        
        if(animated) {
            UIView.animate(withDuration: kAnimationDuration, animations: {
                self.selectionIndicatorView.frame = frame
            })
        }
        else {
            selectionIndicatorView.frame = frame
        }
    }
    
    private func scrollToMakeButtonVisible(index:Int, animated:Bool) {
        let button = segmentButtons[index]
        scrollView.scrollRectToVisible(button.frame, animated: animated)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.updateFramesAndContentSize()
        self.postionIndicatorView(animated: false)
    }
    
    // Actions
    @objc private func segmentTapped(tappedButton:UIButton) {
        if selectedIndex != tappedButton.tag {
            selectedIndex = tappedButton.tag
            postionIndicatorView(animated: true)
            scrollToMakeButtonVisible(index: selectedIndex, animated: true)
            sendActions(for: .valueChanged)
        }
    }
    
    
}
