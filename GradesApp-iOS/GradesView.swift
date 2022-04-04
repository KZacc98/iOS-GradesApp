//
//  ContentView.swift
//  GradesApp-iOS
//
//  Created by Kamil Zachara on 01/04/2022.
//

import SwiftUI

struct GradesView: View {
    var body: some View {
        Text("Hello, gradess!")
        let url = "http://localhost:8080/api/v1/grade"
        //var data = getData(from: url)
        
        
        
        
        
    }
    
    private func getData(from url:String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:{data, response, error in
            guard let data = data, error == nil else{
                print("something wrong chief")
                return
            }
            //data recieved
            var result:Response?
            do{
                result=try JSONDecoder().decode(Response.self,from: data)
            }
            catch{
                print("failed to convert \(error.localizedDescription)")
            }
            guard let json=result else{
                return
            }
            print(json.status)
            print(json.result.gradeValue)
            print(json.result.note)
            print(json.result.subjectId)
        } )
        task.resume()
        
    }
}


struct Response: Codable{
    let result: MyResult
    let status: String
}

struct MyResult: Codable{
    let gradeValue: Double
    let note: String
    let subjectId: Int
}
/*
 {
    "gradeId":1,
    "gradeValue":3.0,
    "note":"TestNote ashgdklasdj",
    "subjectId":1
 },
*/
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GradesView()
    }
}
