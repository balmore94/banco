<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<br>
	<div class="container">

		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Nuevo Cuenta</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form action="addCuenta" method="post">
							<div class="form-group">
								<label>DUI:</label> <input type="text" class="form-control"
									id="dui" placeholder="02121854785-0" name="dui">
							</div>
							<div class="form-group">
								<label>Nombres:</label> <input type="text" class="form-control"
									id="nombres" placeholder="Ingrese su nombre" name="nombres">
							</div>
							<div class="form-group">
								<label>Apellidos:</label> <input type="text"
									class="form-control" id="apellidos"
									placeholder="Ingrese su apellido" name="apellidos">
							</div>
							<div class="form-group">
								<label>Descripcion:</label> <input type="text"
									class="form-control" id="des"
									placeholder="Ingrese la descripcion" name="des">
							</div>
							<div class="form-group">
								<label>Monto:</label> <input type="text" class="form-control"
									id="apellidos" placeholder="Ingrese el monto" name="monto">
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Registrar</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cerrar</button>
							</div>

						</form>
					</div>

					<!-- Modal footer -->

				</div>
			</div>
		</div>

		<!-- Cuenta activa -->
		<div class="modal fade" id="cActiva">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Nuevo Cuenta</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<form action="cuentaActiva" method="post">
							<div class="form-group">
								<label>Cliente:</label> <input type="text" class="form-control"
									id="cliente" placeholder="Ingrese su apellido" name="cliente">
							</div>
							<div class="form-group">
								<label>Descripcion:</label> <input type="text"
									class="form-control" id="des"
									placeholder="Ingrese la descripcion" name="des">
							</div>
							<div class="form-group">
								<label>Monto:</label> <input type="text" class="form-control"
									id="apellidos" placeholder="Ingrese el monto" name="monto">
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Registrar</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cerrar</button>
							</div>

						</form>
					</div>

					<!-- Modal footer -->

				</div>
			</div>
		</div>

		<!-- Modal Transacciones -->
		<div class="modal fade" id="my">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Nueva Transacción</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form action="transaccion" method="post">
							<div class="form-group">
								<label>Saldo:</label> <input type="text" class="form-control"
									id="saldo" name="saldo"> <input id="cuenta"
									name="cuenta">
							</div>
							<div class="form-group">
								<label>Tipo Transaccion:</label> <select class="form-control"
									name="tipo">
									<option>Seleccione</option>

									<c:forEach items="${tipos}" var="tp">
										<option value="${tp.idTpTra}">${tp.descripcionTpt}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label>Cantidad:</label> <input type="text" name="cantidad"
									id="cantidad" class="form-control"
									placeholder="Ingrese la cantidad">
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Guardar</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cerrar</button>
							</div>

						</form>
					</div>

					<!-- Modal footer -->

				</div>
			</div>
		</div>

		<h2>Listado de Clientes</h2>
		<p>Clientes que poseen una cuenta</p>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#myModal">Nuevo Cuenta</button>
		<br> <br> ${msj}<br>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>DUI</th>
					<th>NOMBRE</th>
					<th>APELLIDOS</th>
					<th>OPERAR</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${clientes}" var="ver">
					<tr>
						<td>${ver.idCuenta}</td>
						<td>${ver.cliente.dui}</td>
						<td>${ver.cliente.nombres}</td>
						<td>${ver.cliente.apellidos}</td>


						<td width="250"><select class="form-control"
							onchange="funcion(this);">
								<option value="0" disabled="disabled" selected="selected">Seleccione
									una opcion</option>
								<option value="${ver.saldo},${ver.idCuenta}">Transaccion</option>
								<option value="${ver.cliente.idCliente}">Nueva Cuenta</option>
						</select></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

</body>
<script type="text/javascript">
	$(function() {
		var alert = $('div.alert[auto-close]');
		alert.each(function() {
			var that = $(this);
			var time_period = that.attr('auto-close');
			setTimeout(function() {
				that.alert('close');
			}, time_period);
		});
	});
</script>
<script type="text/javascript">
	function funcion(e) {
		var option = e.options[e.selectedIndex];
		//alert("INDEX: " + e.selectedIndex);

		if (e.selectedIndex == 1) {

			var res = option.value.split(',');
			var s = res[0];
			var c = res[1];
			alert("Saldo" + s);
			alert("Cuenta" + c);
			document.getElementById("saldo").value = s;
			document.getElementById("cuenta").value = c;
			$('#my').modal('show');
		}
		if (e.selectedIndex == 2) {
			//alert('HOLA');
			document.getElementById("cliente").value = option.value;
			$('#cActiva').modal('show');
		}

	}
</script>
</html>

