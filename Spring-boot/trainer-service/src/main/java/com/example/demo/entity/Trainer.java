package com.example.demo.entity;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
@Entity
@Table(name = "trainer")
public class Trainer {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer id;

	public String name;
	@Column(length = 2000, columnDefinition = "TEXT")
	public String mail;
	private String imageUrl;
	private String password;
    
}
