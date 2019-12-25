//
//  WhatsNew.swift
//  WhatsNewTemplate
//
//  Created by Stewart Lynch on 2019-05-05.
//  Copyright © 2019 Stewart Lynch. All rights reserved.
//

import SwiftUI

public class CTWhatsNew {

    public var title:String
    public var intro:String
    public var items:[CTWhatsNewItem] = []
    public var navBarBackgroundColor:UIColor?
    public var navBarCloseButtonColor:UIColor?
    public var navBarTitleColor:UIColor?
    
    public init(title:String, intro:String) {
        self.title = title
        self.intro = intro
    }
    
    public func newItem(_ ctWhatsNewItem:CTWhatsNewItem) {
        items.append(ctWhatsNewItem)
    }
   
    public func shouldShowWhatsNew(isOnDemand:Bool = false) -> Bool {
        let appBuild:String = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
               let appVersion:String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
               let verString = "\(appVersion) Build:\(appBuild)"
               let defaults = UserDefaults.standard
               if !isOnDemand {
                   if defaults.string(forKey: "verString") != verString {
                       return true
                   } else {
                    return false
                }
               } else {
                  return true
               }
    }
    
}

