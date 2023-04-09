package persistence;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import model.Grupos;

public class GruposDAO implements IGruposDAO<Grupos>{

	private GenericDAO gDao;
	
	public GruposDAO(GenericDAO gDao) {
		this.gDao = gDao;
	}
	
	
	@Override
	public List<Grupos> sorteio() throws SQLException, ClassNotFoundException {
		List<Grupos> grupos = new ArrayList<>();
		Connection c = gDao.getConnection();
		
		String proc_sql = "{CALL p_sorteio}";
		
		String sql = " SELECT t.NomeTime, g.Grupo\r\n" + 
				                 " FROM Grupos g, Times t\r\n" + 
				                 " WHERE t.CodigoTime = g.CodigoTime";
		
		
		try {
		CallableStatement cs = c.prepareCall(proc_sql);
		cs.execute();
		
		
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			Grupos grupo = new Grupos();
			grupo.setNometime(rs.getString("NomeTime"));
			grupo.setGrupo(rs.getString("Grupo"));
			grupos.add(grupo);
		}
		
		rs.close();
		ps.close();
		cs.close();
		
		
		} catch(Exception e) {
			PreparedStatement ps = c.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Grupos grupo = new Grupos();
				grupo.setNometime(rs.getString("NomeTime"));
				grupo.setGrupo(rs.getString("Grupo"));
				grupos.add(grupo);
			}
			
			rs.close();
			ps.close();
			
		}
		c.close();
		
		
		return grupos;
	}

	@Override
	public List<Grupos> vergrupoA() throws SQLException, ClassNotFoundException {
		List<Grupos> gruposA = new ArrayList<>();
		Connection c = gDao.getConnection();
		
		String sql = " SELECT t.NomeTime, g.Grupo\r\n" + 
                " FROM Grupos g, Times t\r\n" + 
                " WHERE t.CodigoTime = g.CodigoTime" +
                " AND Grupo = 'A'";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		
		while (rs.next()) {
			Grupos grupoA = new Grupos();
			grupoA.setNometime(rs.getString("NomeTime"));
			grupoA.setGrupo(rs.getString("Grupo"));
			gruposA.add(grupoA);
		}
		
		rs.close();
		ps.close();
		c.close();
		return gruposA;
	}

	@Override
	public List<Grupos> vergrupoB() throws SQLException, ClassNotFoundException {
		List<Grupos> gruposB = new ArrayList<>();
		Connection c = gDao.getConnection();
		
		String sql = " SELECT t.NomeTime, g.Grupo\r\n" + 
                " FROM Grupos g, Times t\r\n" + 
                " WHERE t.CodigoTime = g.CodigoTime" +
                " AND Grupo = 'B'";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupos grupoB = new Grupos();
			grupoB.setNometime(rs.getString("NomeTime"));
			grupoB.setGrupo(rs.getString("Grupo"));
			gruposB.add(grupoB);
		}
		
		rs.close();
		ps.close();
		c.close();
		return gruposB;
	}
	

	@Override
	public List<Grupos> vergrupoC() throws SQLException, ClassNotFoundException {
		List<Grupos> gruposC = new ArrayList<>();
		Connection c = gDao.getConnection();
		
		String sql = " SELECT t.NomeTime, g.Grupo\r\n" + 
                " FROM Grupos g, Times t\r\n" + 
                " WHERE t.CodigoTime = g.CodigoTime" +
                " AND Grupo = 'C'";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupos grupoC = new Grupos();
			grupoC.setNometime(rs.getString("NomeTime"));
			grupoC.setGrupo(rs.getString("Grupo"));
			gruposC.add(grupoC);
		}
		
		rs.close();
		ps.close();
		c.close();
		return gruposC;
	}
	@Override
	public List<Grupos> vergrupoD() throws SQLException, ClassNotFoundException {
		List<Grupos> gruposD = new ArrayList<>();
		Connection c = gDao.getConnection();
		
		String sql = " SELECT t.NomeTime, g.Grupo\r\n" + 
                " FROM Grupos g, Times t\r\n" + 
                " WHERE t.CodigoTime = g.CodigoTime" +
                " AND Grupo = 'D'";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupos grupoD = new Grupos();
			grupoD.setNometime(rs.getString("NomeTime"));
			grupoD.setGrupo(rs.getString("Grupo"));
			gruposD.add(grupoD);
		}
		
		rs.close();
		ps.close();
		c.close();
		return gruposD;
	}

}
