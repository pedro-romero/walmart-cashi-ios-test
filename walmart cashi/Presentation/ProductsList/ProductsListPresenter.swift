//
//  ProductsListPresenter.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

final class ProductsListPresenter {
    private weak var view: ProductsListViewType?
    private let interactor: ProductsListInteractorType
    private var products: [Product] = []
    
    init(interactor: ProductsListInteractorType) {
        self.interactor = interactor
    }
    
    @MainActor
    private func refreshProducts() {
        view?.refreshProducts()
    }
}

extension ProductsListPresenter: ProductsListPresenterType {
    func viewDidLoad() {
        Task {
            do {
                products = try await interactor.fetchProducts()
                await refreshProducts()
            } catch {
                print(error)
            }
        }
    }
    
    func setView(_ view: any ProductsListViewType) {
        self.view = view
    }
    
    func productsCount() -> Int {
        products.count
    }
    
    func product(index: Int) -> Product {
        products[index]
    }
}
