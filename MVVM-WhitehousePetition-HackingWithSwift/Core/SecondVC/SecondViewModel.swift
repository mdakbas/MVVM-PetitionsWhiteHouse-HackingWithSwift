//
//  SecondViewModel.swift
//  MVVM-WhitehousePetition-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 15.08.2023.
//

import Foundation

protocol SecondViewModelProtocol {
    var view: SecondVCProtocol? { get set }
    func viewDidLoad()
    func getSecondDownload()
    func getPetitionModel(index: Int) -> PetitionResults?
}

final class SecondViewModel {
    private let service = Service()
    var petitionService: [PetitionResults] = []
    weak var view: SecondVCProtocol?
}

extension SecondViewModel: SecondViewModelProtocol {
    
    func viewDidLoad() {
        view?.configureTableView()
        getSecondDownload()
    }
    
    func getSecondDownload() {
        service.downloadDetail { [weak self] returnedDetail in
            guard let self else { return }
            guard let returnedDetail = returnedDetail else { return }
            self.petitionService.append(contentsOf: returnedDetail)
            self.view?.reloadTableview()
        }
    }
    
    func getPetitionModel(index: Int) -> PetitionResults? {
        return  petitionService[index]
    }
}
