//
//  BottomTabBarView.swift
//  GradesApp-iOS
//
//  Created by Kamil Zachara on 01/04/2022.
//

import SwiftUI

struct BottomTabBarView: View {
    var body: some View {
        TabView{
            HomeView().tabItem(){
            Image(systemName: "house")
                Text("Home")
            }
            AddView().tabItem(){
            Image(systemName: "plus")
                Text("Add")
            }
            GradesView().tabItem(){
            Image(systemName: "table")
                Text("Grades")
            }
        }
    }
}

struct BottomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBarView()
    }
}
