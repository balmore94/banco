<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="my">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Nuevo Cliente</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="new" method="post">
						<div class="form-group">
							<label>Saldo:</label> <input type="text" class="form-control"
								id="saldo" name="saldo" value="${ver.saldo}">
						</div>
						<div class="form-group">
							<label>Tipo Transaccion:</label> <select class="form-control">
								<option>Seleccione</option>
								
								<c:forEach items="${tipos}" var="tp">
									<option>${tp.descripcionTpt}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="pwd">Apellidos:</label> <input type="text"
								class="form-control" id="apellidos"
								placeholder="Ingrese su apellido" name="apellidos">
						</div>

						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">Registrar</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>

					</form>
				</div>

				<!-- Modal footer -->

			</div>
		</div>
	</div>
</body>
</html>