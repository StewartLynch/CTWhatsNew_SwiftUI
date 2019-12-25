//
//  CTWhatsNewItem.swift
//  WhatsNewMaster
//
//  Created by Stewart Lynch on 8/18/19.
//  Copyright © 2019 Stewart Lynch. All rights reserved.
//

import Foundation


public struct CTWhatsNewItem: Identifiable {
    public let id = UUID()
    public let versionTitle:String
    public let description:String
    public let version:String
    
    public init(version:String, versionTitle:String,description:String){
        self.version = version
        self.versionTitle = versionTitle
        self.description = description
    }
    
}
