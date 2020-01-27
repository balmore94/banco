package com.banco.imp;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.banco.models.Transacciones;
import com.banco.utils.AbstractFacade;
import com.banco.utils.Dao;
import com.banco.utils.HibernateUtil;

@Repository
public class TransaccionesImp extends AbstractFacade<Transacciones> implements Dao<Transacciones>{
	
	@SuppressWarnings("unused")
	private Session session = HibernateUtil.getSessionFactory().openSession();
	
	public TransaccionesImp() {
		super(Transacciones.class);
	}
}
