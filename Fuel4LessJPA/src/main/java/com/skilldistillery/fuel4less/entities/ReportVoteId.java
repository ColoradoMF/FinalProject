package com.skilldistillery.fuel4less.entities;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class ReportVoteId implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="price_report_id")
	private int priceReportId;

	public ReportVoteId() {
		super();
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPriceReport() {
		return priceReportId;
	}

	public void setPriceReport(int priceReport) {
		this.priceReportId = priceReport;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	public ReportVoteId(int userId, int priceReport) {
		super();
		this.userId = userId;
		this.priceReportId = priceReport;
	}

	@Override
	public String toString() {
		return "ReportVoteId [userId=" + userId + ", priceReport=" + priceReportId + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReportVoteId other = (ReportVoteId) obj;
		return userId == other.userId;
	}
	
	


}
