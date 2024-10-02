//
//  MapListConfiguration.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

import UIKit

struct MapListConfiguration {
    static func build() -> UIViewController {
        let remoteDataSource = LocationsRemoteDataSource()
        let repository = LocationsRepository(locationsRemoteDataSorce: remoteDataSource)
        let useCase = FetchLocationsUseCase(remoteRepository: repository)
        let interactor = MapListInteractor(fetchLocationsUseCase: useCase)
        let presenter = MapListPresenter(interactor: interactor)
        let view = MapListViewController(presenter: presenter)
        
        presenter.setView(view)
        
        return view
    }
}
