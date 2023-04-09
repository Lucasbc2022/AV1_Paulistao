package model;

public class Grupos {
	
	private String grupo;
	private String nometime;
	
	public String getGrupo() {
		return grupo;
	}
	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}
	public String getNometime() {
		return nometime;
	}
	public void setNometime(String nometime) {
		this.nometime = nometime;
	}
	
	@Override
	public String toString() {
		return "Grupos [grupo=" + grupo + ", nometime=" + nometime + "]";
	}
	
}
