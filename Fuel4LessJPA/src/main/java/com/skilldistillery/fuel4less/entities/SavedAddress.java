package com.skilldistillery.fuel4less.entities;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;

@Entity
@Table(name="saved_address")
public class SavedAddress{
	@EmbeddedId
	private SavedAddressId id;
	private boolean enabled;
	private String name;
	
	@CreationTimestamp
	@Column(name="create_date")
	private LocalDateTime createDate;
	
	@UpdateTimestamp
	@Column(name="last_update")
	private LocalDateTime lastUpdate;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value="userId")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="address_id")
	@MapsId(value="addressId")
	private Address address;

	public SavedAddress() {
		super();
	}

	public SavedAddress(SavedAddressId id, boolean enabled, String name, LocalDateTime createDate,
			LocalDateTime lastUpdate) {
		super();
		this.id = id;
		this.enabled = enabled;
		this.name = name;
		this.createDate = createDate;
		this.lastUpdate = lastUpdate;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	

	public SavedAddressId getId() {
		return id;
	}


	public void setId(SavedAddressId id) {
		this.id = id;
	}




	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "SavedAddress [id=" + id + ", enabled=" + enabled + ", name=" + name + ", createDate=" + createDate
				+ ", lastUpdate=" + lastUpdate + ", user=" + user + ", address=" + address + "]";
	}

	
	
	
}
