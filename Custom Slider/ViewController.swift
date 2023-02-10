//
//  ViewController.swift
//  Custom Slider
//
//  Created by Manoj kumar on 09/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: CustomProgressView!
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 20
        //progressView.layer.sublayers![1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
        
        progressView.label.text = "0%"
        
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        updateProgress(percentage: sender.value)
        
    }
    
    func updateProgress(percentage: Float) {
        progressView.progress = percentage
        progressView.label.text = "\(Int(percentage * 100))%"
    }
    
    
}



class CustomProgressView: UIProgressView {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //label.frame = bounds
        let labelWidth = label.intrinsicContentSize.width
            let labelHeight = label.intrinsicContentSize.height
        let centerX = (bounds.width - labelWidth) * CGFloat(progress)
            let centerY = bounds.height / 2 - labelHeight / 2
            label.frame = CGRect(x: centerX - 25, y: centerY, width: labelWidth, height: labelHeight)
    }
}
