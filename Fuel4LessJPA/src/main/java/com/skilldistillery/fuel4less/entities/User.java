package com.skilldistillery.fuel4less.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;

@Entity
public class User {
	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private String email;
	private boolean enabled;
	private String role;
	@Column(name="first_name")
	private String firstName;
	@Column(name="last_name")
	private String lastName;
	@Column(name="image_url")
	private String imageUrl;
	private String biography;
	@Column(name="create_date")
	private LocalDateTime createDate;
	@Column(name="last_update")
	private LocalDateTime lastUpdate;
	
	@JsonIgnoreProperties({"user"})
	@OneToMany(mappedBy="user")
	private List<SavedAddress> savedAddresses;
	
	@JsonIgnoreProperties({"users", "priceReports"})
	@ManyToMany
	@JoinTable(name = "user_has_favorite_gas_stations",
	joinColumns=@JoinColumn(name = "user_id"),
	inverseJoinColumns=@JoinColumn(name = "gas_station_id"))
	private List<GasStation> favoriteGasStations;
	
	@JsonIgnore
	@Column(name= "price_report")
	@OneToMany(mappedBy = "user")
	private List<PriceReport> priceReports;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user")
	private List<GasStationReview> gasStationReviews;
	
	// Constructors
	public User() {
		super();
	}

	// Getters & Setters
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public boolean isEnabled() {
		return enabled;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imgUrl) {
		this.imageUrl = imgUrl;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public List<SavedAddress> getSavedAddresses() {
		return savedAddresses;
	}

	public void setSavedAddresses(List<SavedAddress> savedAddresses) {
		this.savedAddresses = savedAddresses;
	}

	public List<GasStation> getFavoriteGasStations() {
		return favoriteGasStations;
	}

	public void setFavoriteGasStations(List<GasStation> favoriteGasStations) {
		this.favoriteGasStations = favoriteGasStations;
	}
	
	public void addFavoriteGasStation(GasStation gasStation) {
		if (favoriteGasStations == null) {
			favoriteGasStations = new ArrayList<>();
		}
		if (! favoriteGasStations.contains(gasStation) ) {
			favoriteGasStations.add(gasStation);
			gasStation.addUser(this);
		}
	}
	
	public void removeFavoriteGasStation(GasStation gasStation) {
		if ( favoriteGasStations != null && favoriteGasStations.contains(gasStation)) {
			favoriteGasStations.remove(gasStation);
			gasStation.removeUser(this);
		}
	}

	public List<PriceReport> getPriceReports() {
		return priceReports;
	}

	public void setPriceReports(List<PriceReport> priceReports) {
		this.priceReports = priceReports;
	}

	public List<GasStationReview> getGasStationReviews() {
		return gasStationReviews;
	}

	public void setGasStationReviews(List<GasStationReview> gasStationReview) {
		this.gasStationReviews = gasStationReview;
	}
	
	

	//hashCode and equals
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=").append(id).append(", username=").append(username).append(", password=")
				.append(password).append(", email=").append(email).append(", enabled=").append(enabled)
				.append(", role=").append(role).append(", firstName=").append(firstName).append(", lastName=")
				.append(lastName).append(", imgUrl=").append(imageUrl).append(", biography=").append(biography)
				.append(", createDate=").append(createDate).append(", lastUpdate=").append(lastUpdate).append("]");
		return builder.toString();
	}
	
	
	
}
