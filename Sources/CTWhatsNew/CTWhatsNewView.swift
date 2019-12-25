//
//  CTWhatsNewView.swift
//  CTWhatsNew_SwiftUI
//
//  Created by Stewart Lynch on 2019-12-24.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

public struct CTWhatsNewView: View {
    public init(ctWhatsNew:CTWhatsNew) {
        self.ctWhatsNew = ctWhatsNew
        if let navBarColor = ctWhatsNew.navBarBackgroundColor {
            UINavigationBar.appearance().barTintColor = navBarColor
        }
        if let tintColor = ctWhatsNew.navBarCloseButtonColor {
            UINavigationBar.appearance().tintColor = tintColor
        }
        if let titleColor = ctWhatsNew.navBarTitleColor {
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:titleColor]
        }
        
    }
    
    @Environment(\.presentationMode) var presentationMode
    var ctWhatsNew:CTWhatsNew
    public var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text(ctWhatsNew.title).font(.title).padding(.top)
                Text(ctWhatsNew.intro).italic()
                List {
                    ForEach(ctWhatsNew.items.reversed()) { item in
                        VStack(alignment: .leading) {
                            Text("VERSION \(item.version)").font(.caption).fontWeight(.heavy)
                            Group {
                                Text(item.versionTitle).fontWeight(.heavy)
                                Text(item.description)
                            }.padding(.leading)
                        }
                    }
                }.listSeparatorStyleNone()
            }.padding(.horizontal)
            .navigationBarTitle(Text(getTitle()), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .frame(width: 40, height:40)
            })
                .onAppear {
                    self.resetValues()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func getTitle() -> String {
        Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
    
    
    func resetValues() {
        let defaults = UserDefaults.standard
        let appBuild:String = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
        let appVersion:String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        let verString = "\(appVersion) Build:\(appBuild)"
        defaults.set(verString, forKey: "verString")
    }
}

public struct ListSeparatorStyleNoneModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.onAppear {
            UITableView.appearance().separatorStyle = .none
        }.onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}

extension View {
    public func listSeparatorStyleNone() -> some View {
        modifier(ListSeparatorStyleNoneModifier())
    }
}

