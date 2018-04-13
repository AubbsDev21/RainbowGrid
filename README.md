RainbowGrid
==============
![Language](https://img.shields.io/badge/language-Swift%204-orange.svg)

## Overview
***Rainbow Gird*** is a demo project I saw on youtube of a channel by LetsBuildThatApp, that I attempped to do. RianBow Grid
tracks your finger gesuture movement and animates a random colored square on a gird.
## Demos
* The gridview 

![magicrainbow_demo](https://user-images.githubusercontent.com/16025198/38750512-2c1e9880-3f23-11e8-96bf-0e40dcf5a754.gif)


* Location output 


![gridoutput](https://user-images.githubusercontent.com/16025198/38750520-3234e850-3f23-11e8-9e77-0870bced7066.gif)

## Code Examples

Populating The UIView /w Colored Blocks and collecting the X and Y keys and put them into an Array
```bash
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
```
Using UIGestureRecongnier and tracking the location while translating it into an X,Y Integers.
```bash
  let width = view.frame.width / CGFloat(numViewperrow)
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        print("x: ",i ," y: ", j)
        let key = "\(i)|\(j)"
        let cellview = cells[key]
```
Implementation of UIView animation 
```bash
 UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1,
                           initialSpringVelocity: 1, options: .curveEaseOut,
                           animations: {
                            self.selectedView?.layer.transform =
                            CATransform3DIdentity
```
Zooming block out
```bash
 view.bringSubview(toFront: cell)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                cellview?.layer.transform = CATransform3DMakeScale(3,3,3)
```
Going back to regular state 
```bash
 if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                cellview?.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }, completion: nil)
        }
```
