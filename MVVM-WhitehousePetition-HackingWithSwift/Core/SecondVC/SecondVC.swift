//
//  SecondVC.swift
//  MVVM-WhitehousePetition-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 14.08.2023.
//

import UIKit

protocol SecondVCProtocol: AnyObject {
    func configureTableView()
    func reloadTableview()
}

final class SecondVC: NavController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel = SecondViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        self.title = "Petition 2"
    }
}

extension SecondVC: SecondVCProtocol {
    
    func configureTableView() {
        self.tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "homeCell")
    }
    
    func reloadTableview() {
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
            tableView.refreshControl?.endRefreshing()
        }
    }
}

extension SecondVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.petitionService.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as? HomeCell {
            cell.updateCell(model: viewModel.getPetitionModel(index: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.detailItem = viewModel.getPetitionModel(index: indexPath.row)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
