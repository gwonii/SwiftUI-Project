//
//  TableCell.swift
//  Project_A
//
//  Created by gwonii on 2020/02/21.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI

struct TableCell: View {
    var body: some View {


        VStack(alignment: .leading) {
            Text("Mail Title")
                .font(.title)
            
            HStack {
                Spacer()
                Text("Time")
                    .foregroundColor(.gray)
                
            }
        }
    .padding()
    }
}

struct TableCell_Previews: PreviewProvider {
    static var previews: some View {
        TableCell()
    }
}
