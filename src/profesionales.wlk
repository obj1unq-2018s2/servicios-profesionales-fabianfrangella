import universidades.*
import asociacionDeProfesionales.*

// esta clase está completa, no necesita nada más
class ProfesionalAsociado {

	var universidad

	method universidad() {
		return universidad
	}

	method universidad(univ) {
		universidad = univ
	}

	method provinciasDondePuedeTrabajar() {
		return #{ "Entre Ríos", "Corrientes", "Santa Fe" }
	}

	method honorariosPorHora() {
		return 3000
	}

	method cobrar(horas) {
		asociacionDeProfesionales.recibirDonacion(horas * self.honorariosPorHora())
	}

}

// a esta clase le faltan métodos
class ProfesionalVinculado {

	var universidad
	var caja

	method universidad() {
		return universidad
	}

	method universidad(univ) {
		universidad = univ
	}

	method honorariosPorHora() {
		return universidad.honorariosRecomendado()
	}

	method provinciasDondePuedeTrabajar() = #{ universidad.provincia() }

	method cobrar(horas) {
		caja = (horas / 2) * self.honorariosPorHora()
		universidad.recibirDonacion((horas / 2) * self.honorariosPorHora())
	}
	
	method caja() = caja

}

// a esta clase le faltan atributos y métodos
class ProfesionalLibre {

	var caja
	var universidad
	var property honorariosPorHora
	var property provinciasDondePuedeTrabajar

	method universidad() {
		return universidad
	}

	method universidad(univ) {
		universidad = univ
	}

	method cobrar(horas) {
		caja += horas * self.honorariosPorHora()
	}

	method recibirDonacion(cantidad) {
		caja += cantidad
	}

	method pasarDinero(profesional, cantidad) {
		profesional.recibirDonacion(cantidad)
	}

	method caja() = caja
}

