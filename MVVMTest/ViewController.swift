//
//  ViewController.swift
//  MVVMTest
//
//  Created by Nirmal on 05/02/21.
//  Copyright © 2021 Nirmal. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var employeeTableView: UITableView!
    
    private var employeeViewModel : EmployeesViewModel!
    
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.employeeViewModel =  EmployeesViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.empData.data, configureCell: { (cell, evm) in
            cell.employeeIdLabel.text = String(evm.id)
            cell.employeeNameLabel.text = evm.employeeName
        })
        
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
    
}
