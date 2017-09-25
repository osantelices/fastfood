Proceso Fastfood
	//auxiliares para iniciar programa
	//opcion: 
	//contador: 
	//i: 
	Definir contador,i como entero;

	//se puede tener 5 clientes a la vez
	//clientes[] guarda los nombres de los clientes
	//se inicia con valor null
	Dimension clientes[5];
	Definir clientes, opcion Como Caracter;
	//inicializar array clientes con null
	para i <- 0 hasta 4 Con Paso 1 hacer 
		clientes[i]="null";
	FinPara
	
	//arreglo para los pedidos de los clientes
	//indice1: ingredientes y pago;
	//indice2: tiempos de preparación
	//indice3: numero de cliente al que corresponde el pedido
	Dimension orden[9,2,5];
	Definir orden Como Entero;
	//inicializar array orden con ceros
	inicializarM(orden,9,2,5);
	
	Repetir
		contador=0;
		Repetir
			Escribir "1)vender 0)cerrar";
			Leer opcion;
			si opcion!="1" y opcion!="0" Entonces
				Escribir "escriba opción valida";
			FinSi
			si opcion="1" Entonces
				vender(orden,clientes,contador);
				si clientes[contador]!="null" Entonces
					contador=contador+1;
				FinSi
			FinSi
			Si ~validarEntero(opcion)Entonces
				Escribir "Ingrese un valor numérico";
			FinSi
		Hasta Que (opcion="0" o contador=5)//correspondiente al numero de clientes
		//agregar opcion para hacer display de informacion con otra opcion: 2)mostrar informacion
	Hasta Que opcion="0";
	escribirArrayN(clientes,5);
	escribirTablaNx2xM(orden,9,5);	
	//Esperar Tecla;
	display(orden, clientes, 9,5);
	
FinProceso
//hace un display de información que contiene un array pedido

Funcion escribirArrayN(array,N)
	Definir i como entero;
	i=0;
	Repetir
		Escribir array[i];
		i=i+1;
	Hasta Que i=N
FinFuncion
Funcion vender(orden,cliente,k)
	Dimension mensaje[9],tiempo[6];
	Definir mensaje,nombre, auxorden como cadena;
	Definir i,tiempo como entero;
	mensaje[0]="¿Quiere mayonesa? 1)si 0)no";
	mensaje[1]="¿Quiere lechuga? 1)si 0)no";
	mensaje[2]="¿Quiere tomate? 1)si 0)no";
	mensaje[3]="¿Quiere queso? 1)si 0)no";
	mensaje[4]="¿Quiere carne, pollo o lomo? 1)carne 2)pollo 3)lomo 0)nada";
	mensaje[5]="Ingrese precio unitario";
	mensaje[6]="Ingrese cantidad de hamburguesas";//////////////////////////////////
	///////////////////////////////////////////////////////////
	mensaje[7]="Que medio de pago usa: 1)tarjeta 2)redcompra 3)efectivo 0)cancelar pedido";
	mensaje[8]="Ingrese efectivo";
	tiempo[0]=2;
	tiempo[1]=2;
	tiempo[2]=3;
	tiempo[3]=2;
	tiempo[4]=3;
	tiempo[5]=5;
	//Arreglo para una hamburguesa de un cliente
	Definir setvalue como logico;
	Para i <- 0 hasta 8 Con Paso 1 Hacer
		si i<4 entonces
			Repetir	
				
				//Validacion de caracteres
				Repetir					
					Escribir mensaje[i];
					leer auxorden;				
					si validarEntero(auxorden) Entonces
						orden[i,0,k]=ConvertirANumero(auxorden);
						setvalue = Verdadero;
					SiNo
						Escribir "Ingrese un valor numérico";
						setvalue=Falso;
					FinSi
				Hasta Que setvalue=Verdadero
				
				//validación
				si orden[i,0,k]=1 Entonces
					orden[i,1,k]=tiempo[i];
				FinSi
				si orden[i,0,k]!=1 y orden[i,0,k]!=0 Entonces
					Escribir "Ingrese opción válida";
				FinSi
			Hasta Que orden[i,0,k]=1 o orden[i,0,k]=0;
		FinSi
		si i=4 o i=7 entonces;
			Repetir				
				//validacion de caracteres
				Repetir					
					Escribir mensaje[i];
					leer auxorden;				
					si validarEntero(auxorden) Entonces
						orden[i,0,k]=ConvertirANumero(auxorden);
						setvalue = Verdadero;
					SiNo
						Escribir "Ingrese un valor numérico";
						setvalue=Falso;
					FinSi
				Hasta Que setvalue=Verdadero
				
				//validación
				si orden[i,0,k]!=0 Y i=4 Entonces
					orden[i,1,k]=tiempo[i];
				FinSi				
				Si orden[i,0,k]!=0 Y i=7 Entonces
					orden[i,1,k]=5;
				FinSi
				si orden[i,0,k]<0 o orden[i,0,k]>3 Entonces
					Escribir "Ingrese opción válida";
				FinSi
				
			Hasta Que orden[i,0,k]>=0 y orden[i,0,k]<=3;			
		FinSi
		Si i=5 o i=6 entonces
			Repetir
				Repetir					
					Escribir mensaje[i];
					leer auxorden;				
					si validarEntero(auxorden) Entonces
						orden[i,0,k]=ConvertirANumero(auxorden);
						setvalue = Verdadero;
					SiNo
						Escribir "Ingrese un valor numérico";
						setvalue=Falso;
					FinSi
				Hasta Que setvalue=Verdadero
			Hasta Que orden[i,0,k]>0
			si i=6 Entonces
				Escribir "El total a pagar es ", orden[5,0,k]*orden[6,0,k];
				Escribir "------------------------";
			FinSi
			
		FinSi
		si i=8 Entonces
			si orden[7,0,k]=3 Entonces
				Repetir
					Repetir					
						Escribir mensaje[i];
						leer auxorden;				
						si validarEntero(auxorden) Entonces
							orden[i,0,k]=ConvertirANumero(auxorden);
							setvalue = Verdadero;
						SiNo
							Escribir "Ingrese un valor numérico";
							setvalue=Falso;
						FinSi
					Hasta Que setvalue=Verdadero
					
					Si orden[i,0,k]<(orden[5,0,k]*orden[6,0,k]) Entonces
						orden[i,0,k]=0;
						i=6;
						Escribir "El monto ingresado es menor al costo de sus productos. Sera redirigido al metodo de pago";
						Escribir "-----------------------------------------------------";
					FinSi
				Hasta Que orden[i,0,k]>(orden[5,0,k]*orden[6,0,k]) o i=6
			SiNo
				orden[i,0,k]=(orden[5,0,k]*orden[6,0,k]);
			FinSi
		FinSi
		
	FinPara
	si orden[7,0,k]!=0 Entonces
		Escribir "Nombre cliente";
		leer nombre;
		cliente[k]=nombre;
	SiNo
		resetear(orden, k);
	FinSi	
	
	
	
FinFuncion
Funcion escribirTablaNx2xM(array,N,M)
	Definir i,j como entero;
	i=0;
	j=0;
	para j<-0 hasta M-1 con paso 1 hacer
		escribir "CLIENTE ",j;
		para i<-0 hasta N-1 con paso 1 hacer
			Escribir array[i,0,j]," ",array[i,1,j];
		FinPara
		
	FinPara
	
FinFuncion
//sean x, y, z dimensiones
//inicializa con ceros
Funcion inicializarM(M,x,ye,z)
	Definir i,j,k como enteros;
	k=0;
	j=0;
	i=0;
	para k<-0 hasta z-1 con paso 1 hacer
		para j<-0 hasta ye-1 con paso 1 hacer
			para i<-0 hasta x-1 con paso 1 hacer
				M[i,j,k]=0;
			FinPara
		FinPara
	FinPara
FinFuncion

//array: arreglo de orden
//k: numero de cliente
//retorna string con informacion de ingredientes
Funcion string<-ingredientes(array,k)
	Definir i como entero;
	Dimension aux[7];
	Definir string, aux como caracter;
	string = "";
	aux[0]="Mayonesa";
	aux[1]="Lechuga";
	aux[2]="Tomate";
	aux[3]="Queso";
	aux[4]="Carne";
	aux[5]="Pollo";
	aux[6]="Lomo";
	para i<- 0 hasta 4 con paso 1 hacer
		si i<4 Entonces
			si array[i,0,k]=1 Entonces
				si string="" Entonces
					string=aux[i];
				SiNo
					string=string+", "+aux[i];
				FinSi
			FinSi
		sino
			segun array[i,0,k] hacer
				1:string=string+", "+aux[i];
				2:string=string+", "+aux[i+1];
				3:string=string+", "+aux[i+2];
			FinSegun
		FinSi
	FinPara
FinFuncion
//array: arreglo de orden
//L: largo del array
//k: numero de cliente
//retorna tiempo para una orden
Funcion atime<-time(array,L,k)
	Definir i,atime como entero;
	atime=0;
	para i<- 0 hasta L-1 con paso 1 hacer
		atime=atime+array[i,1,k];
	FinPara
FinFuncion
//array: arreglo de orden del estilo orden[X,Y,Z] con tres dimesiones
//cliente: array con nombres de clientes
//La: largo array orden
//Lc: largo de array de clientes
//metodo que despliega la información de todas las ventas hasta el momento
Funcion display(array,cliente,La,Lc)
	Definir i,t,tiempok,tmax, cantidad como entero;
	Definir estado Como Caracter;
	
	t=0;
	tmax=0;
	tiempok=0;
	
	Escribir "-----------------------";
	Escribir "COMIDA RAPIDA FAST FOOD";
	Escribir "-----------------------";
	Repetir
		i=0;
		repetir
			//Escribir i;
			si cliente[i] != "null" entonces
				tiempok=time(array,La,i);
				cantidad=array[6,0,i];
				Escribir "Pedido: ",cliente[i];
				Escribir "Hamburguesa: ", ingredientes(array,i);
				Escribir "cantidad: ", cantidad;
				Escribir "Tiempo de espera: ", (tiempok*cantidad), " segundos";
				si t>=tiempok Entonces
					estado="listo";
				SiNo
					estado="curso";
				FinSi
				Escribir "Estado: ", estado;
				Escribir "----------------------------------------";
			FinSi
			i=i+1;
			si tiempok>tmax entonces
				tmax=tiempok;
			FinSi
		Hasta Que i=Lc
		t=t+1;
		Esperar 500 milisegundo;
		Si t!=tmax+1 entonces
			Borrar Pantalla;
		FinSi
		
	Hasta Que t=tmax+1 
	
FinFuncion

//num: numero ingresado como caracter
Funcion bool<-validarEntero(num)
	Definir bool como logico;
	Definir i,j Como Entero;
	i=0;
	Definir aux,auxnum como caracter;
	Para j<-0 hasta Longitud(num)-1 Con Paso 1 Hacer
		i=0;
		Repetir
			aux=subcadena(num,j,j);
			auxnum=convertiratexto(i);
			//Escribir aux," ",auxnum;
			si aux=auxnum entonces
				bool=Verdadero;
				si j!=longitud(num)-1 Entonces
					j=j+1;
					i=0;
				SiNo
					i=10;
				FinSi				
			SiNo
				bool=Falso;
				i=i+1;
			FinSi
			//Escribir i;
		Hasta Que i=10
		si ~bool Entonces
			j=Longitud(num);
		FinSi
	FinPara
FinFuncion

//resetea valores de un pedido cancelado
Funcion resetear(array,k)
	Definir i Como Entero;
	para i<-0 hasta 8 Con Paso 1 Hacer
		array[i,0,k]=0;
		array[i,1,k]=0;
	FinPara
FinFuncion