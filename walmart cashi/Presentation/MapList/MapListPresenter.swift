//
//  MapListPresenter.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

final class MapListPresenter {
    private weak var view: MapListViewType?
    private let interactor: MapListInteractorType
    private var locations: [Location] = []
    
    init(interactor: MapListInteractorType) {
        self.interactor = interactor
    }
    
    @MainActor
    private func refreshLocations() {
        view?.refreshLocations(locations)
    }
}

extension MapListPresenter: MapListPresenterType {
    func viewDidLoad() {
        Task {
            do {
                locations = try await interactor.fetchLocations()
                await refreshLocations()
            } catch {
                print(error)
            }
        }
    }
    
    func setView(_ view: any MapListViewType) {
        self.view = view
    }
}
