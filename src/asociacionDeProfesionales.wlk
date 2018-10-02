object asociacionDeProfesionales {

	var totalRecaudado = 0

	method recibirDonacion(cantidad) {
		totalRecaudado += cantidad
	}
	
	method totalRecaudado() = totalRecaudado

}

