//
//  Employee.swift
//  MVVMTest
//
//  Created by Nirmal on 05/02/21.
//  Copyright © 2021 Nirmal. All rights reserved.
//
import Foundation

// MARK: - Employees
struct Employees: Decodable {
    let status: String
    let data: [EmployeeData]
    let message: String
}

// MARK: - EmployeeData
struct EmployeeData: Decodable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}




//struct Employees: Decodable {
//    let status: String
//    let data: [EmployeeData]
//}
//
//struct EmployeeData: Decodable {
//    let id, employeeName, employeeSalary, employeeAge: String
//    let profileImage: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case employeeName = "employee_name"
//        case employeeSalary = "employee_salary"
//        case employeeAge = "employee_age"
//        case profileImage = "profile_image"
//    }
//}
