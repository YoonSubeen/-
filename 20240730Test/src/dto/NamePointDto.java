package dto;

public class NamePointDto {
	private String name;
	private int point;
	private String pw;
	
	public NamePointDto(String name, int point, String pw) {
		super();
		this.name = name;
		this.point = point;
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
	
	
}
