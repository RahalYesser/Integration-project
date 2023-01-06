package com.example.demo.entity;

import java.util.Date;

import jakarta.persistence.Table;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data

@Entity
@Table(name = "training")
public class Training {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer id;
	public String name;
	@Column(length = 2000, columnDefinition = "TEXT")
	public String description;
	public Date date;
	private String image;
	private String UserId;

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
