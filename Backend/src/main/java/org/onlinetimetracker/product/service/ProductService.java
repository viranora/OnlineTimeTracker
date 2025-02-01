package org.onlinetimetracker.product.service;

import org.onlinetimetracker.product.dto.ProductDto;

import java.util.List;

public interface ProductService {
    List<ProductDto> getAllProducts();
    ProductDto getProductById(String productId);
    ProductDto addProduct(ProductDto productDto);
    ProductDto updateProduct(String productId, ProductDto productDto);
    void deleteProduct(String productId);
    String findProductIdByDetails(String productName, String productDescription, double productPrice);
}
