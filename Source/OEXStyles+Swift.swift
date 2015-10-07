//
//  OEXStyles+Swift.swift
//  edX
//
//  Created by Ehmad Zubair Chughtai on 25/05/2015.
//  Copyright (c) 2015 edX. All rights reserved.
//

import Foundation
import UIKit

extension OEXStyles {
    
    var navigationTitleTextStyle : OEXTextStyle {
        return OEXTextStyle(weight: .SemiBold, size: .Base, color : navigationItemTintColor())
    }
    
    var navigationButtonTextStyle : OEXTextStyle {
        return OEXTextStyle(weight: .SemiBold, size: .XSmall, color: nil)
    }
    
    private var searchBarTextStyle : OEXTextStyle {
        return OEXTextStyle(weight: .Normal, size: .XSmall, color: OEXStyles.sharedStyles().neutralBlack())
    }
    
    public func applyGlobalAppearance() {
        
        if (OEXConfig.sharedConfig().shouldEnableNewCourseNavigation()) {
            //Probably want to set the tintColor of UIWindow but it didn't seem necessary right now
            
            UINavigationBar.appearance().barTintColor = navigationBarColor()
            UINavigationBar.appearance().barStyle = UIBarStyle.Black
            UINavigationBar.appearance().tintColor = navigationItemTintColor()
            UINavigationBar.appearance().titleTextAttributes = navigationTitleTextStyle.attributes
            UIBarButtonItem.appearance().setTitleTextAttributes(navigationButtonTextStyle.attributes, forState: .Normal)
            
            UIToolbar.appearance().tintColor = navigationBarColor()
            
            let styleAttributes = OEXTextStyle(weight: .Normal, size : .Small, color : self.neutralBlack()).attributes
            UISegmentedControl.appearance().setTitleTextAttributes(styleAttributes, forState: UIControlState.Selected)
            UISegmentedControl.appearance().setTitleTextAttributes(styleAttributes, forState: UIControlState.Normal)
            UISegmentedControl.appearance().tintColor = self.neutralLight()
        }
        
        UINavigationBar.appearance().translucent = false

        if #available(iOS 9.0, *) {
            UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.classForCoder()]).defaultTextAttributes = searchBarTextStyle.attributes
        }
    }
    
    ///**Warning:** Not from style guide. Do not add more uses
    public var progressBarTintColor : UIColor {
        return UIColor(red: CGFloat(126.0/255.0), green: CGFloat(199.0/255.0), blue: CGFloat(143.0/255.0), alpha: CGFloat(1.00))
    }
    
    ///**Warning:** Not from style guide. Do not add more uses
    public var progressBarTrackTintColor : UIColor {
        return UIColor(red: CGFloat(223.0/255.0), green: CGFloat(242.0/255.0), blue: CGFloat(228.0/255.0), alpha: CGFloat(1.00))
    }


    var standardTextViewInsets : UIEdgeInsets {
        return UIEdgeInsetsMake(8, 8, 8, 8)
    }
    
    var standardFooterHeight : CGFloat {
        return 50
    }
    
    private var standardVerticalMargin : CGFloat {
        return 8.0
    }
    
    var discussionsBackgroundColor : UIColor {
        return OEXStyles.sharedStyles().neutralXLight()
    }

// Standard text Styles
    
    var textAreaBodyStyle : OEXTextStyle {
        let style = OEXMutableTextStyle(weight: OEXTextWeight.Normal, size: .Small, color: OEXStyles.sharedStyles().neutralDark())
        style.lineBreakMode = .ByWordWrapping
        return style
    }

// Standard button styles

    var filledPrimaryButtonStyle : ButtonStyle {
        let buttonMargins : CGFloat = 8
        let borderStyle = BorderStyle()
        let textStyle = OEXTextStyle(weight: .Normal, size: .Small, color: self.neutralWhite())
        return ButtonStyle(textStyle: textStyle, backgroundColor: OEXStyles.sharedStyles().primaryBaseColor(), borderStyle: borderStyle,
            contentInsets : UIEdgeInsetsMake(buttonMargins, buttonMargins, buttonMargins, buttonMargins))
    }
    
// Standard border styles
    var entryFieldBorderStyle : BorderStyle {
        return BorderStyle(width: .Size(1), color: OEXStyles.sharedStyles().neutralLight())
    }
    
    var endorsedPostBorderStyle : BorderStyle {
        return BorderStyle(width: .Hairline, color: OEXStyles.sharedStyles().utilitySuccessBase())
    }
    
}

//Convenience computed properties for margins
var StandardHorizontalMargin : CGFloat {
    return OEXStyles.sharedStyles().standardHorizontalMargin()
}

var StandardVerticalMargin : CGFloat {
    return OEXStyles.sharedStyles().standardVerticalMargin
}