Proceso FastFood
	//No es necesario tomar en cuenta el punto 1 sobre el sistema de publicidad
	Escribir "Estamos en un proceso";
	Dimension nombre[5,2];
	Definir nombre Como Entero;
	
	nombre[1,0] = 2;
	Escribir cuenta;
	
	Escribir "saltar el subproceso";
FinProceso

SubProceso cuenta <- cuenta
	Definir i como entero;
	i=0;
	Repetir
		Escribir i;
		Esperar 1 Segundos;
		i=i+1;
		Borrar Pantalla;
	Hasta Que i=10;
FinSubProceso
	