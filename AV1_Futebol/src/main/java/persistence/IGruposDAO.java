package persistence;

import java.sql.SQLException;
import java.util.List;

public interface IGruposDAO<Grupos> {
	
	public List<Grupos> sorteio() throws SQLException, ClassNotFoundException;
	
	public List<Grupos> vergrupoA() throws SQLException, ClassNotFoundException;
	public List<Grupos> vergrupoB() throws SQLException, ClassNotFoundException;
	public List<Grupos> vergrupoC() throws SQLException, ClassNotFoundException;
	public List<Grupos> vergrupoD() throws SQLException, ClassNotFoundException;

}
