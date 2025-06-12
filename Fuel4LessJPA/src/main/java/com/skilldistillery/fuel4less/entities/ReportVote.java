package com.skilldistillery.fuel4less.entities;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="report_vote")
public class ReportVote {
	
	@EmbeddedId
	private ReportVoteId id;
	private boolean vote;
	
	@Column(name="create_date")
	private LocalDateTime createDate;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value="userId")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="price_report_id")
	@MapsId(value="priceReportId")
	private PriceReport priceReport;

	public ReportVote() {
		super();
	}

	public boolean isVote() {
		return vote;
	}

	public void setVote(boolean vote) {
		this.vote = vote;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}
	

	public ReportVoteId getId() {
		return id;
	}

	public void setId(ReportVoteId id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public PriceReport getPriceReport() {
		return priceReport;
	}

	public void setPriceReport(PriceReport priceReport) {
		this.priceReport = priceReport;
	}
	

	public ReportVote(ReportVoteId id, boolean vote, LocalDateTime createDate, User user, PriceReport priceReport) {
		super();
		this.id = id;
		this.vote = vote;
		this.createDate = createDate;
		this.user = user;
		this.priceReport = priceReport;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReportVote [vote=").append(vote).append(", createDate=").append(createDate).append("]");
		return builder.toString();
	}
	
}
