package vn.iotstar.service;
import java.util.List;
import vn.iotstar.entity.Product;

public interface IProductService {
    void insert(Product product);
    void update(Product product);
    void delete(int id) throws Exception;
    Product findById(int id);
    List<Product> findAll();
    List<Product> findAll(int page, int pagesize);
    List<Product> findTop10();
    int count();
}
