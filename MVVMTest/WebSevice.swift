//
//  WebSevice.swift
//  MVVMTest
//
//  Created by Nirmal on 05/02/21.
//  Copyright © 2021 Nirmal. All rights reserved.
//

import Foundation


class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    func apiToGetEmployeeData(completion : @escaping (Employees) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let empData = try? jsonDecoder.decode(Employees.self, from: data)
                guard let emp = empData else {
                    return
                }
                completion(emp)
            }
            
        }.resume()
    }
    
}
