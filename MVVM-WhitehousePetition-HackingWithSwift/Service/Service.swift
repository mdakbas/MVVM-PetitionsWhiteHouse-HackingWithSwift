//
//  PetitionService.swift
//  WhitehousePetitions-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 10.08.2023.
//

import Foundation

final class Service {
    
    func download(completion: @escaping([PetitionResults]?)->()) {
        guard let url = URL(string: ApiUrls.firstTabBar()) else { return }
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
                break
            case .failure(let error):
                self.handleWithError(error)
                break
            }
        }
    }
    
    func downloadDetail(completion: @escaping([PetitionResults]?)->()) {
        guard let url = URL(string: ApiUrls.secondTabBar()) else { return }
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
                break
            case .failure(let error):
                self.handleWithError(error)
                break
            }
        }
    }
    
    private func handleWithError(_ error:Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [PetitionResults]? {
        do {
            let decoder =  try JSONDecoder().decode(Petition.self, from: data)
            return decoder.results
        } catch {
            print(error)
            return nil
        }
    }
}
