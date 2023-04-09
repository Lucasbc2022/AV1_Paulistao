package model;

public class Times {

	private int codigotime;
	private String nometime;
	private String cidade;
	private String estadio;
	private String exportivo;
	
	public int getCodigotime() {
		return codigotime;
	}
	public void setCodigotime(int codigotime) {
		this.codigotime = codigotime;
	}
	public String getNometime() {
		return nometime;
	}
	public void setNometime(String nometime) {
		this.nometime = nometime;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstadio() {
		return estadio;
	}
	public void setEstadio(String estadio) {
		this.estadio = estadio;
	}
	public String getExportivo() {
		return exportivo;
	}
	public void setExportivo(String exportivo) {
		this.exportivo = exportivo;
	}
	
	@Override
	public String toString() {
		return "Times [codigotime=" + codigotime + ", nometime=" + nometime + ", cidade=" + cidade + ", estadio="
				+ estadio + ", exportivo=" + exportivo + "]";
	}
	
	
}
