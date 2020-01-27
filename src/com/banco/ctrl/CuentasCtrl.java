package com.banco.ctrl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.banco.imp.ClienteImp;
import com.banco.imp.CuentasImp;
import com.banco.imp.TipotImp;
import com.banco.imp.TransaccionesImp;
import com.banco.models.Cliente;
import com.banco.models.Cuenta;
import com.banco.models.TpTransaccion;
import com.banco.models.Transacciones;

@Controller
public class CuentasCtrl {

	String mensaje = "";
	ModelAndView model = new ModelAndView();

	@Autowired
	private ClienteImp cliente;

	@Autowired
	private CuentasImp cuenta;
	
	@Autowired
	private TipotImp tptransaccion;

	@Autowired
	private TransaccionesImp transacciones;
	
	@RequestMapping(value = "/transaccion", method = RequestMethod.POST)
	public ModelAndView newTransaccion(@RequestParam("cantidad") BigDecimal valor, @RequestParam("tipo") int tipo,
			@RequestParam("cuenta") int cuenta) {
		try {
			Cuenta c = new Cuenta();

			c.setIdCuenta(cuenta);
			
			TpTransaccion tp = new TpTransaccion();
			tp.setIdTpTra(tipo);
			
			Transacciones t = new Transacciones();
			t.setValor(valor);
			t.setFechaTra(new Date());
			t.setTpTransaccion(tp);
			t.setCuenta(c);
			
			System.out.println("Valor " + t.getValor());
			System.out.println("Fecha " + t.getFechaTra());
			System.out.println("Tipo tr " + t.getTpTransaccion().getIdTpTra());
			System.out.println();
			
			transacciones.save(t);
			
			String mensaje = "<div class=\"alert alert-success alert-dismissible\" role=\"alert\" auto-close=\"5000\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Transaccion exitosa!</div>";
			model.addObject("msj", mensaje);
		} catch (Exception e) {
			String mensaje = "<div id=\"moo\" class=\"alert alert-danger alert-dismissible\" role=\"alert\" auto-close=\"3000\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Ocurrio un error</div>";
			model.addObject("msj", mensaje);
		}
		model.addObject("msj", mensaje);
		model.setViewName("inicio");
		showInicio();
		return model;
	}
	
	
	@RequestMapping(value = "/inicio", method = RequestMethod.GET)
	public ModelAndView showInicio() {
		List<TpTransaccion> tipo = tptransaccion.findAll();
		List<Cuenta> clientes = cuenta.findAll();

		System.out.println("NUMERO DE REGISTROS TIPO T: " + tipo.size());
		model.addObject("clientes", clientes);
		model.addObject("tipos", tipo);
		model.setViewName("inicio");
		return model;
	}

	@RequestMapping(value = "/addCuenta", method = RequestMethod.POST)
	public ModelAndView agregar(@RequestParam("dui") int dui, @RequestParam("nombres") String nombre,
			@RequestParam("apellidos") String apellidos, @RequestParam("des") String des,
			@RequestParam("monto") BigDecimal monto) {
		try {
			List<Cliente> lcliente = new ArrayList<>();
			lcliente = cliente.clienteDUI(dui);
			
			if (lcliente.size() == 0) {
				Cliente c = new Cliente();
				c.setDui(dui);
				c.setNombres(nombre);
				c.setApellidos(apellidos);
				cliente.save(c);
				
				Cuenta cu = new Cuenta();
				cu.setDescripcion(des);
				cu.setMontoInicial(monto);
				cu.setSaldo(monto);
				cu.setCreacion(cu.getCreacion());
				cu.setEstado(true);
				cu.setCliente(c);
				cuenta.save(cu);
				mensaje = "<div class=\"alert alert-success alert-dismissible\" role=\"alert\" auto-close=\"5000\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Registro Guardado!</div>";
				model.addObject("msj", mensaje);
			}else {
				mensaje = "<div id=\"moo\" class=\"alert alert-danger alert-dismissible\" role=\"alert\" auto-close=\"3000\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>El cliente ingresado ya esta registrado, busque y asignele una nueva cuenta</div>";
				model.addObject("msj", mensaje);
			}
			
			
			
		} catch (Exception e) {
			model.addObject("msj", "Exito");
		}
		model.setViewName("inicio");
		
		return model;
	}
}
