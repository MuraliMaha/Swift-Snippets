//
//  UIViewExtension.swift
//  Feed Me
//
/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

extension UIView {
    
    // MARK: - Loader {
    
    func StartLoading() {
        
        if let _ = viewWithTag(10000) {
            //View is already Loading
        }
        else {
            
            let lockView = UIView(frame: bounds)
            lockView.backgroundColor = UIColor.clear
            lockView.tag = 10000
            
            addSubview(lockView)
            
            let container = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            container.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6)
            container.layer.cornerRadius = 5
            container.clipsToBounds = true
            container.center =  lockView.center
            lockView.addSubview(container)
            
            let activity = UIActivityIndicatorView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
            activity.activityIndicatorViewStyle = .whiteLarge
            activity.hidesWhenStopped = true
            activity.center = container.center
            
            lockView.addSubview(activity)
            lockView.bringSubview(toFront: activity)
            
            activity.startAnimating()
        }
    }
    
    func isLoading() -> Bool {
        if viewWithTag(10000) != nil {
            return true
        }
        return false
    }
    
    func StopLoading() {
        if let lockView = viewWithTag(10000) {
            UIView.animate(withDuration: 0.2, animations: {
                
            }) { finished in
                lockView.removeFromSuperview()
            }
        }
    }
    
    // MARK: - }

    // MARK: - Toast Make Black and White {
    
    func ShowBlackTostWithText(message:String!,Interval:TimeInterval) {
        
        var NowTag = 0
        
        for Tag in 10..<50 {
            if viewWithTag(Tag) == nil {
                NowTag = Tag
                break
            }
        }
        
        let TostView = UIView()
        TostView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        TostView.clipsToBounds = true
        TostView.layer.cornerRadius = 15
        TostView.tag = NowTag
        
        TostView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(TostView)
        
        NSLayoutConstraint(item: TostView, attribute:.width, relatedBy:.lessThanOrEqual, toItem: self, attribute:.width, multiplier: 1, constant:-24).isActive = true
        NSLayoutConstraint(item: TostView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute:.bottom, multiplier: 1, constant:-20).isActive = true
        NSLayoutConstraint(item: TostView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute:.centerX, multiplier: 1, constant:0).isActive = true
        NSLayoutConstraint(item: TostView, attribute: .height, relatedBy:.greaterThanOrEqual, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant:30).isActive = true
        
        
        let TostLbl = UILabel.init()
        TostLbl.text = message!
        TostLbl.textColor = UIColor.white
        TostLbl.backgroundColor = UIColor.clear
        TostLbl.font = UIFont.systemFont(ofSize: 14.0)
        TostLbl.numberOfLines = 10
        TostLbl.textAlignment = .center
        
        TostLbl.translatesAutoresizingMaskIntoConstraints = false
        
        TostView.addSubview(TostLbl)
        
        let Info1 = ["TostView":TostView,"TostLbl":TostLbl]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[TostLbl]-15-|", options: [], metrics: nil, views: Info1))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[TostLbl]-5-|", options: [], metrics: nil, views: Info1))
        
        
        let InfoDict = ["Tag":"\(NowTag)"]
        
        Timer.scheduledTimer(timeInterval: Interval, target: self, selector: #selector(StopAuto), userInfo: InfoDict, repeats: false)
    }
    
    func ShowWhiteTostWithText(message:String!,Interval:TimeInterval) {
        
        var NowTag = 0
        
        for Tag in 10..<50 {
            if viewWithTag(Tag) == nil {
                NowTag = Tag
                break
            }
        }
        
        let TostView = UIView()
        TostView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        TostView.clipsToBounds = true
        TostView.layer.cornerRadius = 15
        TostView.tag = NowTag
        
        TostView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(TostView)
        
        NSLayoutConstraint(item: TostView, attribute:.width, relatedBy:.lessThanOrEqual, toItem: self, attribute:.width, multiplier: 1, constant:-24).isActive = true
        NSLayoutConstraint(item: TostView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute:.bottom, multiplier: 1, constant:-20).isActive = true
        NSLayoutConstraint(item: TostView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute:.centerX, multiplier: 1, constant:0).isActive = true
        NSLayoutConstraint(item: TostView, attribute: .height, relatedBy:.greaterThanOrEqual, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant:30).isActive = true
        
        
        let TostLbl = UILabel.init()
        TostLbl.text = message!
        TostLbl.textColor = UIColor.black
        TostLbl.backgroundColor = UIColor.clear
        TostLbl.font = UIFont.systemFont(ofSize: 14.0)
        TostLbl.numberOfLines = 10
        TostLbl.textAlignment = .center
        
        TostLbl.translatesAutoresizingMaskIntoConstraints = false
        
        TostView.addSubview(TostLbl)
        
        let Info1 = ["TostView":TostView,"TostLbl":TostLbl]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[TostLbl]-15-|", options: [], metrics: nil, views: Info1))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[TostLbl]-5-|", options: [], metrics: nil, views: Info1))
        
        let InfoDict = ["Tag":"\(NowTag)"]
        
        Timer.scheduledTimer(timeInterval: Interval, target: self, selector: #selector(StopAuto), userInfo: InfoDict, repeats: false)
    }
    
    func StopAuto(_ time:Timer) {
        
        let InfoDict:[String:String] = time.userInfo as! [String:String]
        
        if let TostView = viewWithTag(Int(InfoDict["Tag"]!)!) {
            
            UIView.animate(withDuration: 0.2, animations: {
            }) { finished in
                TostView.removeFromSuperview()
            }
        }
    }
  
    // MARK: - }
    
    // MARK: - View Fadeout {

    func fadeOut(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = 0.0
        }
    }
    
    func fadeIn(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = 1.0
        }
    }
    
    // MARK: - }
    
    // MARK: - ViewFromXib {

    class func viewFromNibName(name: String) -> UIView? {
        let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        return views?.first as? UIView
    }
    // MARK: - }

    func lock() {
        if let _ = viewWithTag(110) {
            //View is already locked
        }
        else {
            let lockView = UIView(frame: bounds)
            lockView.backgroundColor = UIColor.white
            lockView.tag = 110
            lockView.alpha = 0.7
            lockView.layer.cornerRadius = 2
            
            let activity = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
            activity.hidesWhenStopped = true
            lockView.addSubview(activity)
            activity.startAnimating()
            addSubview(lockView)
            
            let Loading = UILabel()
            Loading.center = CGPoint.init(x: lockView.center.x - 85, y: lockView.center.y)
            Loading.textColor = UIColor.black
            Loading.text = "Loading..."
            Loading.font = UIFont.systemFont(ofSize: 13)
            lockView.addSubview(Loading)
            
            activity.translatesAutoresizingMaskIntoConstraints = false
            Loading.translatesAutoresizingMaskIntoConstraints = false

            let Info1 = ["activity":activity,"Loading":Loading]

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-2-[activity(30)]-3-[Loading]-2-|", options: [], metrics: nil, views: Info1))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[activity]-0-|", options: [], metrics: nil, views: Info1))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[Loading]-0-|", options: [], metrics: nil, views: Info1))

            UIView.animate(withDuration: 0.2) {
                lockView.alpha = 1.0
            }
        }
    }
    
    func unlock() {
        if let lockView = viewWithTag(110) {
            UIView.animate(withDuration: 0.2, animations: {
                lockView.alpha = 0.7
            }) { finished in
                lockView.removeFromSuperview()
            }
        }
    }
    
    func ImageLoaderStart() {
        if let _ = viewWithTag(120) {
            //View is already locked
        }
        else {
            let lockView = UIView(frame: bounds)
            lockView.backgroundColor = UIColor.clear
            lockView.tag = 120
//            lockView.alpha = 0.7
            lockView.layer.cornerRadius = 2
            
            let activity = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
            activity.hidesWhenStopped = true
            lockView.addSubview(activity)
            activity.startAnimating()
            activity.color = UIColor.black
            activity.tintColor = UIColor.black
            addSubview(lockView)
            
            activity.translatesAutoresizingMaskIntoConstraints = false
            
            let Info1 = ["activity":activity]
            
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-2-[activity]-2-|", options: [], metrics: nil, views: Info1))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[activity]-2-|", options: [], metrics: nil, views: Info1))
            
            UIView.animate(withDuration: 0.2) {
                lockView.alpha = 1.0
            }
        }
    }
    
    func ImageLoaderStop() {
        if let lockView = viewWithTag(120) {
            UIView.animate(withDuration: 0.2, animations: {
//                lockView.alpha = 0.7
            }) { finished in
                lockView.removeFromSuperview()
            }
        }
    }
    
}


@IBDesignable extension UIView {

    @IBInspectable var BorderColor: UIColor? {
        set {
            layer.borderColor = (newValue?.cgColor)!
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable var BorderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            let width = layer.borderWidth
            if width != 0 {
                return width
            }
            else {
                return 0
            }
        }
    }
    
    @IBInspectable var ShadowColor: UIColor? {
        set {
            layer.borderColor = (newValue?.cgColor)!
            layer.shadowRadius = layer.shadowRadius == 0 ? 2 : layer.shadowRadius
            layer.shadowOffset = CGSize.zero
            layer.shadowOpacity = 0.5
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable var ShadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
            layer.shadowOffset = CGSize.zero
            if (layer.shadowColor == nil) {
                layer.shadowColor = UIColor.black.cgColor
            }
            layer.shadowOpacity = 0.5
        }
        get {
            return layer.shadowRadius
        }
    }
    
    @IBInspectable var CornerRadiusMulti: CGFloat {
        set {
            layer.cornerRadius = frame.width / newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var CornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
