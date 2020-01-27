package com.banco.imp;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.banco.models.Cliente;
import com.banco.utils.AbstractFacade;
import com.banco.utils.Dao;
import com.banco.utils.HibernateUtil;

@Repository
public class ClienteImp extends AbstractFacade<Cliente> implements Dao<Cliente>{
	
	private Session session = HibernateUtil.getSessionFactory().openSession();
	
	public ClienteImp() {
		super(Cliente.class);
	}
	
	public List<Cliente> clienteDUI(int d){
		try {
			String sql = "SELECT * FROM cliente WHERE dui = '" + d + "';";
			session.beginTransaction();
			List<Cliente>cl = session.createNativeQuery(sql, Cliente.class).getResultList();
			session.flush();
			session.getTransaction().commit();
			return cl;
		} catch (Exception e) {
			session.clear();
			session.close();
			return null;
		}
	}
	
	
}
