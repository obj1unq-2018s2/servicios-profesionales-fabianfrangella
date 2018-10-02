class Empresa {

	var empleados = #{}
	var honorarioDeReferencia

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
		profesional.provinciasDondePuedeTrabajar().any{ 
			provincia => self.provinciaEstaCubierta(provincia)}.any{
				empleado => empleado.honorariosPorHora() < profesional.honorariosPorHora()
			}
	}

}

