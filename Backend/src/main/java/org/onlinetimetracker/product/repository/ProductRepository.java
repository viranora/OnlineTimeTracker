package org.onlinetimetracker.product.repository;

import org.onlinetimetracker.product.entity.Product;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
//burada biz MongoRepository'i kullanarak direkt onun methodlarını inheritance alırız
@Repository()
public interface ProductRepository extends MongoRepository<Product, String> {
    Optional<Product> findByProductId(String id);
    Optional<Product> findIdByProductNameAndProductDescriptionAndProductPrice(String productName, String productDescription, double productPrice);
}
