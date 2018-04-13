//
//  ViewController.swift
//  Magic Grid
//
//  Created by Aubre Body on 2/13/18.
//  Copyright © 2018 Aubre Body. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numViewperrow = 15
    var cells = [String: UIView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let width = view.frame.width / CGFloat(numViewperrow)
       let height = view.frame.height
        
        for j in 0...40 {
            for i in 0...numViewperrow {
                let View = UIView()
                View.backgroundColor = randomColor()
                View.layer.borderWidth = 0.5
                View.layer.borderColor = UIColor.black.cgColor
                View.layer.masksToBounds = true
                View.frame = CGRect(x: i * Int(width), y: j * Int(width), width: Int(width), height: Int(width))
                view.addSubview(View)
                let key = "\(i)|\(j)"
                cells[key] = View
            }
        }
        
        //touch rec
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
       
    }
    
    var selectedView: UIView?
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: view)
       // print(location)
        
        let width = view.frame.width / CGFloat(numViewperrow)
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        print("x: ",i ," y: ", j)
        let key = "\(i)|\(j)"
        let cellview = cells[key]
        if selectedView != cellview {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1,
                           initialSpringVelocity: 1, options: .curveEaseOut,
                           animations: {
                            self.selectedView?.layer.transform =
                            CATransform3DIdentity
                  }, completion: nil)
        }
        selectedView = cellview
        
        if let cell = cellview{
            view.bringSubview(toFront: cell)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                cellview?.layer.transform = CATransform3DMakeScale(3,3,3)
                
            }, completion: nil)
        }
        
        //if it snaps back in place
        if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                cellview?.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }, completion: nil)
        }
       
       //brute force way///////
        /*var loopCount = 0
        for subview in view.subviews {
            if subview.frame.contains(location){
                 subview.backgroundColor = .green
               // print("count: ", loopCount)
            }
           loopCount += 1
        }*/
    }
  
    func randomColor() -> UIColor {
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
       //Brute force /////
    /*    let rand = Int(arc4random_uniform(9))
        print(rand)
        let color: UIColor
        
        switch rand {
        case 0:
           color = UIColor.black
        case 1:
          color =  UIColor.red
        case 2:
          color =  UIColor.blue
        case 3:
          color =  UIColor.cyan
        case 4:
          color =  UIColor.green
        default:
           color = UIColor.orange
        }
        return color*/
        
    }

}

