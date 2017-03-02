//
//  ViewController.swift
//  DHSegmentedControl
//
//  Created by d_hudinwal on 03/02/2017.
//  Copyright (c) 2017 d_hudinwal. All rights reserved.
//

import UIKit
import DHSegmentedControl

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var scrollabelSegmentControl:DHSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        scrollabelSegmentControl = DHSegmentedControl(items: [DHSegmentTitle("ELECTRONICS"), DHSegmentTitle("APPLIANCES"), DHSegmentTitle("MEN"), DHSegmentTitle("WOMEN"), DHSegmentTitle("BABY & KIDS"), DHSegmentTitle("BOOKS & MORE"), DHSegmentTitle("OFFER ZONE")
            ])
        scrollabelSegmentControl.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 44)
        scrollabelSegmentControl.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin,.flexibleWidth]
        scrollabelSegmentControl.addTarget(self, action: #selector(segmentControlValueChanged(segmentControl:)), for: .valueChanged)
        view.addSubview(scrollabelSegmentControl)
    }
    
    func segmentControlValueChanged(segmentControl:DHSegmentedControl) {
        //
    }

}

