package com.codegym.customermanager.service;



import com.codegym.customermanager.model.Product;


import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Long, Product> products;

    static {
        products = new HashMap<>();
        products.put(1L, new Product(1, "John", "hhhhhhhhh", new BigDecimal(2000), LocalDate.of(2023,2,2)));
        products.put(2L, new Product(2, "Bill", "billgfd", new BigDecimal(3000), LocalDate.of(2023,1,6)));
        products.put(3L, new Product(3, "Alex", "aasds", new BigDecimal(5000), LocalDate.of(2023,2,2)));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(long id) {
        return products.get(id);
    }

    @Override
    public void update(long id, Product customer) {
        products.put(id, customer);
    }

    @Override
    public void remove(long id) {
        products.remove(id);
    }
}
