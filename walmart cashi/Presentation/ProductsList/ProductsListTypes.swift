//
//  ProductsListTypes.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

// MARK: - View
protocol ProductsListViewType: AnyObject {
    func refreshProducts()
}

// MARK: - Interactor
protocol ProductsListInteractorType: AnyObject {
    func fetchProducts() async throws -> [Product]
}

// MARK: - Presenter
protocol ProductsListPresenterType: AnyObject {
    func viewDidLoad()
    func setView(_ view: ProductsListViewType)
    func productsCount() -> Int
    func product(index: Int) -> Product
}
