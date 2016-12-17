//
//  Item.swift
//  TableViewLazyLoadingDemo
//
//  Created by Shinkangsan on 12/16/16.
//  Copyright © 2016 Sheldon. All rights reserved.
//

import UIKit

let imgStr1 = "https://awesomewallpaper.files.wordpress.com/2012/09/z.jpg"
let imgStr2 = "http://wallpapercave.com/wp/gemrhcX.jpg"
let imgStr3 = "http://media.idownloadblog.com/wp-content/uploads/2016/06/macOS-Sierra-Wallpaper-Macbook-Wallpaper.jpg"
let imgStr4 = "http://www.allmacwallpaper.com/get/Retina-MacBook-Pro-15-inch-wallpapers/Winter-Christmas-2880x1800/7270-8.jpg"
let imgStr5 = "https://9to5mac.files.wordpress.com/2014/08/yosemite-4.jpg?quality=82&strip=all"
let imgStr6 = "http://www.allmacwallpaper.com/get/iMac-21-inch-wallpapers/Let-It-Rain-3-1920x1080/731-9.jpg"
let imgStr7 = "http://i.imgur.com/u2oPC.jpg"


class Item: NSObject {
    var nameStr:String?=nil
    var imageStr:String?=nil
    
    init(name:String,img:String) {
        self.nameStr = name
        self.imageStr = img
    }
    
    func makeItems() -> [Item] {
        var Items = [Item]()
        Items.append(Item(name: "item1", img: imgStr1))
        Items.append(Item(name: "item2", img: imgStr2))
        Items.append(Item(name: "item3", img: imgStr3))
        Items.append(Item(name: "item4", img: imgStr4))
        Items.append(Item(name: "item5", img: imgStr5))
        Items.append(Item(name: "item6", img: imgStr6))
        Items.append(Item(name: "item7", img: imgStr7))
        return Items
    }
    
}
