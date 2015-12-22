//
//  ThumbView.swift
//  ThumbExpense
//
//  Created by Desheng Xu on 12/21/15.
//  Copyright © 2015 Desheng Xu. All rights reserved.
//

import UIKit

class ThumbView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.*/
    override func drawRect(rect: CGRect) {
        // Drawing code
        //print("current View has width with var: \(radius)")
        let deltaAngle : Double = 90.0 / Double(numberOfCommand)
        let context = UIGraphicsGetCurrentContext()
        
        for index in 1...numberOfCommand{
            let startAngle = (90 + Double((index-1)) * deltaAngle + ThumbScale.AngleStartBias) * M_PI / 180
            let endAngle = (90 + Double(index) * deltaAngle - ThumbScale.AngleEndBias) * M_PI / 180
            
            print("Start Angle:\(startAngle) and End Angle:\(endAngle)")
            
            let x0 = radius - ThumbScale.RadiusShortFactor * radius * sin(startAngle)
            let y0 = radius + ThumbScale.RadiusShortFactor * radius * cos(startAngle)
            let x1 = radius - ThumbScale.RadiusLongFactor * radius * sin(startAngle)
            let y1 = radius + ThumbScale.RadiusLongFactor * radius * cos(startAngle)
            let x2 = radius - ThumbScale.RadiusLongFactor * radius * sin(endAngle)
            let y2 = radius + ThumbScale.RadiusLongFactor * radius * cos(endAngle)
            let x3 = radius - ThumbScale.RadiusShortFactor * radius * sin(endAngle)
            let y3 = radius + ThumbScale.RadiusShortFactor * radius * cos(endAngle)
            
            var points = [CGPoint]()
            points.append(CGPoint(x: x0,y: y0))
            points.append(CGPoint(x: x1,y: y1))
            points.append(CGPoint(x: x2,y: y2))
            points.append(CGPoint(x: x3,y: y3))
            
            print("Points are:\(points)")
            
            CGContextAddLines(context, points, points.count)
            
            //let cgcolor = color.CGColor
            CGContextSetFillColorWithColor(context,UIColor.blueColor().CGColor)
            CGContextFillPath(context)
            
            
        }
    }

    private var radius: Double {
        return Double (bounds.size.width)
    }
    
    func showPoint(gesture: UITapGestureRecognizer){
        if gesture.state == UIGestureRecognizerState.Ended {
            print("point:\(gesture.locationInView(self))")
        }
    }

    private struct ThumbScale {
        static let RadiusLongFactor = 0.95
        static let RadiusShortFactor = 0.45
        static let AngleStartBias = 2.0
        static let AngleEndBias = 2.0
    }
    
    var numberOfCommand = 4 //how many command this tool will draw
    
    
    

}
