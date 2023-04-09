package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Times;

public class TimesDAO implements ITimeDAO<Times>{

	private GenericDAO gDao;
	
	public TimesDAO(GenericDAO gDao) {
		this.gDao = gDao;
	}
	@Override
	public List<Times> listar() throws SQLException, ClassNotFoundException {
	    List<Times> times = new ArrayList<>();
	    
	    Connection c = gDao.getConnection();
	    String sql = "SELECT CodigoTime, NomeTime, Cidade, Estadio, MaterialEsportivo FROM Times ORDER BY NomeTime";
	    PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    
	    while(rs.next()) {
	    	Times time = new Times();
	    	time.setCodigotime(rs.getInt("CodigoTime"));
	    	time.setNometime(rs.getString("NomeTime"));
	    	time.setCidade(rs.getString("Cidade"));
	    	time.setEstadio(rs.getString("Estadio"));
	    	time.setExportivo(rs.getString("MaterialEsportivo"));
	    	times.add(time);
	    }
	    rs.close();
	    ps.close();
	    c.close();
		return times;
	}

}
