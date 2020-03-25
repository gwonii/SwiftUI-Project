//
//  OrganizationViewModel.swift
//  Project_E
//
//  Created by gwonii on 2020/03/08.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI

class PersonModel: Identifiable {
    
    var id = UUID()
    var personName: String
    var personRank: String
    var personPosition: String
    var personEmail: String
    
    init(personName: String?, personRank: String?, personPosition: String?, personEmail: String?) {
        self.personName = personName ?? ""
        self.personRank = personRank ?? ""
        self.personPosition = personPosition ?? ""
        self.personEmail = personEmail ?? ""
    }
}

let peopleData: [PersonModel] = [
    PersonModel(personName: "gwonii", personRank: "CEO", personPosition: "President", personEmail: "hcgwonii@daou.co.kr"),
    PersonModel(personName: "hyuns" , personRank: "Managing Director", personPosition: "Planning Team", personEmail: "bins@daou.co.kr"),
    PersonModel(personName:  "yyoons", personRank: "Staff", personPosition: "HR Team", personEmail: "yyoo@daou.co.kr"),
    PersonModel(personName:  "bins", personRank: "Staff", personPosition: "R&D Team", personEmail: "binbin@daou.co.kr")
]



