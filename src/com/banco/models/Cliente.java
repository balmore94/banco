package com.banco.models;
// Generated 25-ene-2020 9:44:09 by Hibernate Tools 5.2.12.Final

import static javax.persistence.GenerationType.IDENTITY;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Cliente generated by hbm2java
 */
@Entity
@Table(name = "cliente", catalog = "si_banco", uniqueConstraints = @UniqueConstraint(columnNames = "dui"))
public class Cliente implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idCliente;
	private int dui;
	private String nombres;
	private String apellidos;
	private List<Cuenta> cuentas = new ArrayList<>();

	public Cliente() {
	}

	public Cliente(int idCliente, int dui, String nombres, String apellidos) {
		this.idCliente = idCliente;
		this.dui = dui;
		this.nombres = nombres;
		this.apellidos = apellidos;
	}

	public Cliente(int idCliente, int dui, String nombres, String apellidos, List<Cuenta> cuentas) {
		this.idCliente = idCliente;
		this.dui = dui;
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.cuentas = cuentas;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id_cliente", unique = true, nullable = false)
	public int getIdCliente() {
		return this.idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	@Column(name = "dui", unique = true, nullable = false)
	public int getDui() {
		return this.dui;
	}

	public void setDui(int dui) {
		this.dui = dui;
	}

	@Column(name = "nombres", nullable = false, length = 60)
	public String getNombres() {
		return this.nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	@Column(name = "apellidos", nullable = false, length = 60)
	public String getApellidos() {
		return this.apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cliente")
	public List<Cuenta> getCuentas() {
		return this.cuentas;
	}

	public void setCuentas(List<Cuenta> cuentas) {
		this.cuentas = cuentas;
	}

}