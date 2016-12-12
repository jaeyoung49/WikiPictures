package org.kosta.wikipictures.vo;

public class TimeMachineVO {
	private int timeMachineYear;
	private String timeMachineTitle;
	private String timeMachineContent;
	private String timeMachineKeyword;

	public TimeMachineVO() {
		super();
	}

	public TimeMachineVO(int timeMachineYear, String timeMachineTitle, String timeMachineContent,
			String timeMachineKeyword) {
		super();
		this.timeMachineYear = timeMachineYear;
		this.timeMachineTitle = timeMachineTitle;
		this.timeMachineContent = timeMachineContent;
		this.timeMachineKeyword = timeMachineKeyword;
	}

	public int getTimeMachineYear() {
		return timeMachineYear;
	}

	public void setTimeMachineYear(int timeMachineYear) {
		this.timeMachineYear = timeMachineYear;
	}

	public String getTimeMachineTitle() {
		return timeMachineTitle;
	}

	public void setTimeMachineTitle(String timeMachineTitle) {
		this.timeMachineTitle = timeMachineTitle;
	}

	public String getTimeMachineContent() {
		return timeMachineContent;
	}

	public void setTimeMachineContent(String timeMachineContent) {
		this.timeMachineContent = timeMachineContent;
	}

	public String getTimeMachineKeyword() {
		return timeMachineKeyword;
	}

	public void setTimeMachineKeyword(String timeMachineKeyword) {
		this.timeMachineKeyword = timeMachineKeyword;
	}

	@Override
	public String toString() {
		return "TimeMachineVO [timeMachineYear=" + timeMachineYear + ", timeMachineTitle=" + timeMachineTitle
				+ ", timeMachineContent=" + timeMachineContent + ", timeMachineKeyword=" + timeMachineKeyword + "]";
	}

}
