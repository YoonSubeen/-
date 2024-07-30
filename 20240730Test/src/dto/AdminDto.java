package dto;

public class AdminDto {
	private String name; 
	private int point;
	private String pw; 
	private String id;
	
	public AdminDto(String name, int point, String pw, String id) {
		super();
		this.name = name;
		this.point = point;
		this.pw = pw;
		this.id = id;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}
