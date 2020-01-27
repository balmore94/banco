package com.banco.utils;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.banco.imp.ClienteImp;
import com.banco.imp.CuentasImp;
import com.banco.imp.TipotImp;
import com.banco.imp.TransaccionesImp;
import com.banco.models.Cliente;
import com.banco.models.Cuenta;
import com.banco.models.TpTransaccion;
import com.banco.models.Transacciones;

/*import com.telefonia.imp.ClienteImp;*/


@Configuration
@EnableWebMvc
@ComponentScan("com.banco")
@EnableTransactionManagement(proxyTargetClass = true)
public class Config {

	@Bean
	InternalResourceViewResolver viewRes() {
		InternalResourceViewResolver r = new InternalResourceViewResolver();
		r.setPrefix("/WEB-INF/views/");
		r.setSuffix(".jsp");
		return r;
	}

	@Bean
	public SessionFactory getConex() {
		return HibernateUtil.getSessionFactory();
	}

	/*@Bean
	public Dao<Personas> personas() {
		return new PersonaImp();
	}*/
	
	@Bean
	public Dao<Cliente> cliente(){
		return new ClienteImp();
	}

	@Bean
	public Dao<Cuenta> cuenta(){
		return new CuentasImp();
	}
	
	@Bean
	public Dao<TpTransaccion> tptransaccion(){
		return new TipotImp();
	}
	
	@Bean
	public Dao<Transacciones> transacciones(){
		return new TransaccionesImp();
	}
}
