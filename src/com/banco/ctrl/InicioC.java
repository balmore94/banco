package com.banco.ctrl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.banco.imp.ClienteImp;
import com.banco.models.Cliente;


@Controller
public class InicioC {

	String mensaje = "";
	ModelAndView model = new ModelAndView();

	@Autowired
	private ClienteImp cliente;



	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public ModelAndView newCliente(@RequestParam("dui") int dui, @RequestParam("nombres") String nombres,
			@RequestParam("apellidos") String apellidos) {
		try {
			Cliente c = new Cliente();
			c.setDui(dui);
			c.setNombres(nombres);
			c.setApellidos(apellidos);
			cliente.save(c);
			mensaje = "<div class=\"alert alert-success alert-dismissible\" role=\"alert\" auto-close=\"5000\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Registro Guardado!</div>";
			model.addObject("msj", mensaje);
		} catch (Exception e) {
			mensaje = "<div id=\"moo\" class=\"alert alert-danger alert-dismissible\" role=\"alert\" auto-close=\"3000\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Ocurrió un error, no se guardo el registro</div>";
		}
		model.setViewName("inicio");
		return model;
	}
}
