package ar.edu.unq.acahaygatoencerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Habitacion extends Seleccionable{

	List<Accion> acciones = new ArrayList<Accion>
	String descripcion
	
	new (String nombre){
		if(esUnaHabitacionValida(nombre)){
			this.nombre = nombre
		} else {
			throw new Exception("Nombre de Habitacion invalido")
		}
	}
	
	new() {
			
	}

	def esUnaHabitacionValida(String nombreHabitacion) {
		!nombreHabitacion.empty && !nombreHabitacion.toCharArray.get(0).equals(" ")
	}

	def crearAccionDeIrAOtraHabitacion(Habitacion habitacion) {
		acciones.add(new AccionDeIrHabitacion(habitacion))
	}
	
	def crearAccionDeAgarrarUnElemento(String nombreItem) {
		acciones.add(new AccionDeAgarrarUnItem(nombreItem))
	}
	
	def eliminarAccion(Accion accion) {
		acciones.remove(accion)
	}
	
	def crearAccionDeUsarUnItem(Item itemAUsar, Habitacion habitacionALaCualIr) {
		acciones.add(new AccionDeUsarUnItem(itemAUsar, habitacionALaCualIr))
	}
	
	def crearAccionDeUsarUnItem(Item itemAUsar, Item itemNuevo) {
		acciones.add(new AccionDeUsarUnItem(itemAUsar, itemNuevo))
	}
}