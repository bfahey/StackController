//
//  Corgi.swift
//  StackControllerExample
//
//  Created by Blaine Fahey on 3/26/16.
//  Copyright © 2016 Blaine Fahey. All rights reserved.
//

import UIKit

struct HelloImCallie {
    static let images = [
        "https://instagram.fsnc1-1.fna.fbcdn.net/t51.2885-15/e15/11355160_450804038430943_438880939_n.jpg?ig_cache_key=MTAxNjk5NTU4MTg1NjMyNDIwNQ%3D%3D.2",
        "https://instagram.fsnc1-1.fna.fbcdn.net/t51.2885-15/s640x640/sh0.08/e35/11372127_527195077432544_1355637360_n.jpg?ig_cache_key=MTAzMDc5NTU5NTAxMTMzMjg2OA%3D%3D.2",
        "https://instagram.fsnc1-1.fna.fbcdn.net/t51.2885-15/e35/11375330_474317332735380_333433786_n.jpg?ig_cache_key=MTAzNTgzNzU4MzQwMjIxMTQzOQ%3D%3D.2",
        "https://instagram.fsnc1-1.fna.fbcdn.net/t51.2885-15/s640x640/sh0.08/e35/12728574_1696060640675507_181092569_n.jpg?ig_cache_key=MTE4ODA2MjIyNjY0NDIxMjI0Ng%3D%3D.2",
        "https://instagram.fsnc1-1.fna.fbcdn.net/t51.2885-15/s640x640/sh0.08/e35/1172441_540507019456779_1551922924_n.jpg?ig_cache_key=MTE4NTgwNzcxNTYxNTY0MzY4Mg%3D%3D.2",
        "https://instagram.fsnc1-1.fna.fbcdn.net/t51.2885-15/s640x640/sh0.08/e35/11324490_418393785033662_380953415_n.jpg?ig_cache_key=MTA3NjMxMDQ0MDI4NDI2NTAyNA%3D%3D.2",
        "https://instagram.fsnc1-1.fna.fbcdn.net/t51.2885-15/e15/11142226_1574783956137240_899555342_n.jpg?ig_cache_key=OTcxODI5NzI4NjM4OTMzODI5.2",
        "https://instagram.fsnc1-1.fna.fbcdn.net/t51.2885-15/e15/11328350_1640070526252943_162143740_n.jpg?ig_cache_key=MTAwMjQ5NzkwODc2Nzk4ODQzMw%3D%3D.2",
        "https://instagram.fsnc1-1.fna.fbcdn.net/t51.2885-15/s640x640/sh0.08/e35/12628006_1042991459077553_1154547737_n.jpg?ig_cache_key=MTE4MjMzNzE3NTI0NDUxMjIwNQ%3D%3D.2"
    ]
    
    static func openInSafari() {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://instagram.com/helloimcallie")!)
    }
}