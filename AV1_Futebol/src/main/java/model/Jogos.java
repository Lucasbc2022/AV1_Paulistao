package model;


import java.time.LocalDate;



public class Jogos {
	
	private String nometimeA;
	private String nometimeB;
	private int golstimeA;
	private int golstimeB;
	private LocalDate data;
	public String getNometimeA() {
		return nometimeA;
	}
	public void setNometimeA(String nometimeA) {
		this.nometimeA = nometimeA;
	}
	public String getNometimeB() {
		return nometimeB;
	}
	public void setNometimeB(String nometimeB) {
		this.nometimeB = nometimeB;
	}
	public int getGolstimeA() {
		return golstimeA;
	}
	public void setGolstimeA(int golstimeA) {
		this.golstimeA = golstimeA;
	}
	public int getGolstimeB() {
		return golstimeB;
	}
	public void setGolstimeB(int golstimeB) {
		this.golstimeB = golstimeB;
	}
	public LocalDate getData() {
		return data;
	}
	public void setData(LocalDate data) {
		this.data = data;
	}
	
	@Override
	public String toString() {
		return "Jogos [nometimeA=" + nometimeA + ", nometimeB=" + nometimeB + ", golstimeA=" + golstimeA
				+ ", golstimeB=" + golstimeB + ", data=" + data + "]";
	}
	
	

}
