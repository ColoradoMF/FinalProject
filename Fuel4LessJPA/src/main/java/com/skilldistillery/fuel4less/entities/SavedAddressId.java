package com.skilldistillery.fuel4less.entities;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class SavedAddressId implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Column(name="user_id")
	private int userId;
	@Column(name="address_id")
	private int addressId;
	
	public SavedAddressId() {
		super();
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(addressId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SavedAddressId other = (SavedAddressId) obj;
		return addressId == other.addressId && userId == other.userId;
	}

	@Override
	public String toString() {
		return "SavedAddressId [userId=" + userId + ", addressId=" + addressId + "]";
	}
	
	
	
	
	
	

}
