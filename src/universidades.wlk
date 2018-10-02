import profesionales.*
class Universidad {
	var provincia
	var honorarios
	var donaciones
	method provincia() = provincia
	method honorariosRecomendado() = honorarios
	method recibirDonacion(cantidad){
		donaciones+=cantidad
	}
	method donaciones() = donaciones
}

