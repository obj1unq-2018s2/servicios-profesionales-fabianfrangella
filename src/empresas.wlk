import solicitantes.*

class Empresa {

	var empleados = #{}
	var honorarioDeReferencia
	var clientes = #{}
	var horasServicio

	method horasServicio() = horasServicio

	method clientes() = clientes

	method honorarioDeReferencia() = honorarioDeReferencia

	method empleados() = empleados

	method contratar(empleado) {
		empleados.add(empleado)
	}

	method profesionalesCaros() = empleados.filter{ empleado => empleado.honorariosPorHora() > self.honorarioDeReferencia() }

	method universidadesFormadoras() = empleados.map{ empleado => empleado.universidad() }.asSet()

	method profesionalMasBarato() = empleados.min{ empleado => empleado.honorariosPorHora() }

	method provinciaEstaCubierta(provincia) = empleados.any{ empleado => empleado.provinciasDondePuedeTrabajar().contains(provincia) }

	method cuantosEstudiaronEn(universidad) = empleados.filter{ empleado => empleado.universidad() == universidad }.size()

	method esPocoAtractivo(profesional) {
		return empleados.any{ empleado => empleado.honorariosPorHora() < profesional.honorariosPorHora() && empleado.provinciasDondePuedeTrabajar().difference(profesional.provinciasDondePuedeTrabajar()) != empleado.provinciasDondePuedeTrabajar() }
	}

	method darServicio(solicitante) {
		if (!empleados.any{empleado=>solicitante.puedeSerAtendido(empleado)}) {
			self.error("nadie puede atender al solicitante")
		} else {
			self.puedenAtender(solicitante).anyOne().cobrar(horasServicio)
			clientes.add(solicitante)
			
		}
	}

	method puedenAtender(solicitante) = empleados.filter{ empleado => solicitante.puedeSerAtendido(empleado) }
	
	method cantidadDeClientes() = clientes.size()
	
	method tieneComoCliente(cliente) = clientes.contains(cliente)

}

