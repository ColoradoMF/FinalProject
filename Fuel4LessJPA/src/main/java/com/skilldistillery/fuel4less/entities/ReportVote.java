package com.skilldistillery.fuel4less.entities;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Table(name="report_vote")
public class ReportVote {
	
	private boolean vote;
	
	@Column(name="create_date")
	private LocalDateTime createDate;

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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReportVote [vote=").append(vote).append(", createDate=").append(createDate).append("]");
		return builder.toString();
	}
	
}
