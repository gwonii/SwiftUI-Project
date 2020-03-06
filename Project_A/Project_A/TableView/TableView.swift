//
//  TableView.swift
//  Project_A
//
//  Created by gwonii on 2020/02/20.
//  Copyright © 2020 gwonii. All rights reserved.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

struct TableView: View {
    
    var body: some View {
        
        NavigationView {
            ScrollView {
  
                TAManagementBoxView()
                EmailBoxView()
                EmailBoxView()
            }
                
            .navigationBarTitle(Text("Today"), displayMode: .inline)
                
            .navigationBarItems(trailing:
                Image(systemName: "bookmark.fill")
            )
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.barTintColor = UIColor(red: 100/255, green: 200/255, blue: 200/255, alpha: 1)
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                })
        }
    }
}



struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        
        TableView()
    }
}
