package com.banco.imp;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.banco.models.TpTransaccion;
import com.banco.utils.AbstractFacade;
import com.banco.utils.Dao;
import com.banco.utils.HibernateUtil;

@Repository
public class TipotImp extends AbstractFacade<TpTransaccion> implements Dao<TpTransaccion>{
	
	@SuppressWarnings("unused")
	private Session session = HibernateUtil.getSessionFactory().openSession();
	
	public TipotImp() {
		super(TpTransaccion.class);
	}
}
