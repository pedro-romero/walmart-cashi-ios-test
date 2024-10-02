//
//  ProductCD+Mapping.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

import CoreData

extension ProductCD {
    func toDTO() -> ProductDTO {
        return .init(id: Int(id),
                     title: title ?? "",
                     description: productDescription ?? "",
                     category: category ?? "",
                     price: price,
                     discountPercentage: discountPercentage,
                     rating: rating)
    }
}

extension ProductDTO: CoreDataMapper {
    func toEntity(in context: NSManagedObjectContext) -> NSManagedObject {
        let entity = ProductCD(context: context)
        entity.id = Int32(id)
        entity.title = title
        entity.productDescription = description
        entity.category = category
        entity.price = price
        entity.discountPercentage = discountPercentage
        entity.rating = rating
        return entity
    }
}
