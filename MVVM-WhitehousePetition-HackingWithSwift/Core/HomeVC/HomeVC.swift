//
//  HomeVC.swift
//  MVVM-WhitehousePetition-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 14.08.2023.
//

import UIKit

protocol HomeVCProtocol: AnyObject {
    func configureTableView()
    func reloadTableview()
}

final class HomeVC: NavController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        self.title = "Petition 1"
    }
}

extension HomeVC: HomeVCProtocol {
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

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
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
