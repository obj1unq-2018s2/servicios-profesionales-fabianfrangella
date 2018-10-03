import profesionales.*

class Persona{
	
	var provincia
	
	method provincia() = provincia
	
	method puedeSerAtendido(profesional) = profesional.provinciasDondePuedeTrabajar().contains(self.provincia())
}

class Institucion{
	var universidades
	method puedeSerAtendido(profesional) = universidades.contains(profesional.universidad())
}