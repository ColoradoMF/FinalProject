package com.skilldistillery.fuel4less.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="gas_station")
public class GasStation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@CreationTimestamp
	@Column(name="create_date")
	private LocalDateTime createdDate;
	
	@UpdateTimestamp
	@Column(name="update_date")
	private LocalDateTime updateDate;
	private String remarks;
	
	@JsonIgnore
	@ManyToMany(mappedBy = "favoriteGasStations")
	private List<User> users;
	
	@ManyToMany(mappedBy = "gasStations")
	private List<Tag> tags;
	
	@JsonIgnoreProperties({"gasStation"})
	@OneToMany(mappedBy="gasStation")
	private List<PriceReport> priceReports;
	
	@JsonIgnore
	@OneToMany(mappedBy="gasStation")
	private List<GasStationReview> gasStationReview;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "address_id")
	private Address address;
	
	public GasStation() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	public LocalDateTime getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(LocalDateTime updateDate) {
		this.updateDate = updateDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<PriceReport> getPriceReports() {
		return priceReports;
	}

	public void setPriceReports(List<PriceReport> priceReports) {
		this.priceReports = priceReports;
	}

	public List<GasStationReview> getGasStationReview() {
		return gasStationReview;
	}

	public void setGasStationReview(List<GasStationReview> gasStationReview) {
		this.gasStationReview = gasStationReview;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GasStation other = (GasStation) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GasStation [id=").append(id).append(", name=").append(name).append(", imageUrl=")
				.append(imageUrl).append(", createdDate=").append(createdDate).append(", updateDate=")
				.append(updateDate).append(", remarks=").append(remarks).append("]");
		return builder.toString();
	}
	
	
	
}