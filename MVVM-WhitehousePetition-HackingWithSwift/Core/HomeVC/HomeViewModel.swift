//
//  HomeViewModel.swift
//  WhitehousePetitions-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 10.08.2023.
//

import Foundation


protocol HomeViewModelProtocol {
    var view: HomeVCProtocol? { get set }
    func viewDidLoad()
}

final class HomeViewModel {
    private let service = Service()
    var petitionService: [PetitionResults] = []
    weak var view: HomeVCProtocol?
}

extension HomeViewModel: HomeViewModelProtocol {
    func viewDidLoad() {
        view?.configureTableView()
        getPetition()
    }
    
    func getPetition() {
        service.download { [weak self] returnedPetition in
            guard let self = self else { return }
            guard let returnedPetition = returnedPetition else { return }
            self.petitionService.append(contentsOf: returnedPetition)
            self.view?.reloadTableview()
        }
    }
    
    func getPetitionModel(index: Int) -> PetitionResults? {
        return  petitionService[index]
    }
}
