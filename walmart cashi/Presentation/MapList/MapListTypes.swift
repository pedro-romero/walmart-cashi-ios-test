//
//  MapListTypes.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

// MARK: - View
protocol MapListViewType: AnyObject {
    func refreshLocations(_ locations: [Location])
}

// MARK: - Interactor
protocol MapListInteractorType: AnyObject {
    func fetchLocations() async throws -> [Location]
}

// MARK: - Presenter
protocol MapListPresenterType: AnyObject {
    func viewDidLoad()
    func setView(_ view: MapListViewType)
}
