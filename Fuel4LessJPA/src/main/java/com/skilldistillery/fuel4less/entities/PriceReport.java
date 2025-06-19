package com.skilldistillery.fuel4less.entities;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="price_report")
public class PriceReport {
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int id;
	
	@Column(name="price_per_gallon")
	private BigDecimal pricePerGallon;
	
	private boolean enabled;
	
	@CreationTimestamp
	@Column(name="create_date")
	private LocalDateTime createDate;
	
	@UpdateTimestamp
	@Column(name="last_update")
	private LocalDateTime lastUpdate;
	
	private String remarks;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@JsonIgnoreProperties({"priceReports"})
	@ManyToOne
	@JoinColumn(name="gas_station_id")
	private GasStation gasStation;
	
	@ManyToOne
	@JoinColumn(name="fuel_type_id")
	private FuelType fuelType;
	
//	@JsonIgnoreProperties({"priceReport"})
	@JsonIgnore
	@OneToMany(mappedBy = "priceReport")
	List<ReportVote> reportVotes;

	public PriceReport() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public BigDecimal getPricePerGallon() {
		return pricePerGallon;
	}

	public void setPricePerGallon(BigDecimal pricePerGallon) {
		this.pricePerGallon = pricePerGallon;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public GasStation getGasStation() {
		return gasStation;
	}

	public void setGasStation(GasStation gasStation) {
		this.gasStation = gasStation;
	}

	public FuelType getFuelType() {
		return fuelType;
	}

	public void setFuelType(FuelType fuelType) {
		this.fuelType = fuelType;
	}

	public List<ReportVote> getReportVotes() {
		return reportVotes;
	}

	public void setReportVotes(List<ReportVote> reportvotes) {
		this.reportVotes = reportvotes;
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
		PriceReport other = (PriceReport) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PriceReport [id=").append(id).append(", pricePerGallon=").append(pricePerGallon)
				.append(", enabled=").append(enabled).append(", createDate=").append(createDate).append(", lastUpdate=")
				.append(lastUpdate).append(", remarks=").append(remarks).append("]");
		return builder.toString();
	}

}
