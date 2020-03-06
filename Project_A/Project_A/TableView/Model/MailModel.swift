//
//  MailModel.swift
//  Project_A
//
//  Created by gwonii on 2020/02/21.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI
import CoreLocation

struct MailModel: Identifiable {

    let id = UUID()
    let mailTitle: String
    let time: String
    
    init(mailTitle: String, time: String) {
        self.mailTitle = mailTitle
        self.time = time
    }
}
