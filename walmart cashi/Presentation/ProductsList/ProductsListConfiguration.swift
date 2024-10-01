//
//  ProductsListConfiguration.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

import UIKit

struct ProductsListConfiguration {
    static func build() -> UIViewController {
        let remoteDataSource = ProductsRemoteDataSource()
        let repository = ProductsRepository(productsRemoteDataSorce: remoteDataSource)
        let useCase = FetchProductsUseCase(remoteRepository: repository)
        let interactor = ProductsListInteractor(fetchProductsUseCase: useCase)
        let presenter = ProductsListPresenter(interactor: interactor)
        let view = ProductsListViewController(presenter: presenter)
        
        presenter.setView(view)
        
        return view
    }
}
