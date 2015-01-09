//
//  ViewController.swift
//  AnimationsOnViewUsingSwift
//
//  Created by Varun Tomar on 09/01/15.
//  Copyright (c) 2015 Corebits. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animatedView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewCurlUp(view:UIView,animationTime:Float)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(NSTimeInterval(animationTime))
        UIView.setAnimationTransition(UIViewAnimationTransition.CurlUp, forView: view, cache: false)
        
        UIView.commitAnimations()
    }
    
    func viewCurlDown(view:UIView,animationTime:Float)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(NSTimeInterval(animationTime))
        UIView.setAnimationTransition(UIViewAnimationTransition.CurlDown, forView: view, cache: false)
        
        UIView.commitAnimations()
    }
    
    func viewFlipFromLeft(view:UIView,animationTime:Float)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(NSTimeInterval(animationTime))
        UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromLeft, forView: view, cache: false)
        
        UIView.commitAnimations()
    }
    
    func viewMoveInFromTop(view:UIView,animationTime:Float)
    {
        var animation:CATransition = CATransition()
        animation.duration = CFTimeInterval(animationTime)
        animation.type = "moveIn"
        animation.timingFunction = CAMediaTimingFunction(name: "easeInEaseOut")
        animation.subtype = "fromBottom"
        animation.fillMode = "forwards"
        view.layer.addAnimation(animation, forKey: nil)
        
    }
    
    func animationRotationEffect(view:UIView,animationTime:Float)
    {
        UIView.animateWithDuration(NSTimeInterval(animationTime), animations: { () -> Void in
            
            var animation:CABasicAnimation = CABasicAnimation(keyPath: "transform")
            animation.toValue = NSValue(CATransform3D:CATransform3DMakeRotation(CGFloat(M_PI), 1, 1, 1))
            
            animation.duration = CFTimeInterval(animationTime)
            animation.cumulative = true
            animation.repeatCount  = 2
            
            view.layer.addAnimation(animation, forKey: nil)
        })
    }
    
    func animationScaleEffect(view:UIView,animationTime:Float)
    {
        UIView.animateWithDuration(NSTimeInterval(animationTime), animations: {
            
            view.transform = CGAffineTransformMakeScale(0.001, 0.001)
            
            },completion:{completion in
                UIView.animateWithDuration(NSTimeInterval(animationTime), animations: { () -> Void in
                    
                    view.transform = CGAffineTransformMakeScale(1, 1)
                })
        })
        
    }
    
    @IBAction func performAnimation(sender: AnyObject) {
        
        //self.viewCurlUp(animatedView, animationTime: 1.0)
        //self.viewCurlDown(animatedView, animationTime: 1.0)
        //self.viewFlipFromLeft(animatedView, animationTime: 1.0)
       // self.viewMoveInFromTop(animatedView, animationTime: 1.0)
        //self.animationRotationEffect(animatedView, animationTime: 1.0)
        self.animationScaleEffect(animatedView, animationTime: 1.0)


    }

}

