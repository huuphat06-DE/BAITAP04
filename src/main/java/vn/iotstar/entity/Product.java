package vn.iotstar.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
@Table(name="products")
@NamedQueries({
    @NamedQuery(name="Product.findAll", query="SELECT p FROM Product p ORDER BY p.createdAt DESC"),
    @NamedQuery(name="Product.count", query="SELECT count(p) FROM Product p")
})
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    
    @Column(columnDefinition="NVARCHAR(MAX)")
    private String description;
    
    private double price;
    private String image;
    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name="CategoryId")
    private Category category;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }

    public Product() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }
}
