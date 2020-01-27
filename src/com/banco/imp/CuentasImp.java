package com.banco.imp;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.banco.models.Cuenta;
import com.banco.utils.AbstractFacade;
import com.banco.utils.Dao;
import com.banco.utils.HibernateUtil;

@Repository
public class CuentasImp extends AbstractFacade<Cuenta> implements Dao<Cuenta>{
	
	@SuppressWarnings("unused")
	private Session session = HibernateUtil.getSessionFactory().openSession();
	
	public CuentasImp() {
		super(Cuenta.class);
	}
}
