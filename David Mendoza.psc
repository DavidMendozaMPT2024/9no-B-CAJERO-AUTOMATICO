
	Algoritmo CajeroAutomatico
		// Definición de variables
		Definir intentos, contra, opc, cantidad, i, j, nuevaContrasena, servicio_opc Como Entero;
		Definir autenticado, salir Como Logico;
		Definir monto, monto_envio,saldos,contrasenas Como Real;
		Definir num_celular,numdecuenta,numdecel Como Entero; 
		Definir continuar Como Caracter; 
		Definir usuarios como cadena; 
		Dimension contrasenas[3];
		Dimension usuarios[3];
		Dimension numdecuenta[3];
		Dimension saldos[3];
		Dimension numdecel[3]; 
		
		// Inicialización de valores
		saldos[0] <- 1500;
		saldos[1] <- 2000;
		saldos[2] <- 3000;
		contrasenas[0] <- 1111;
		contrasenas[1] <- 2222;
		contrasenas[2] <- 3333;
		usuarios[0] <- "Dvid Mendoza Garrido";
		usuarios[1] <- "Juansisco";
		usuarios[2] <- "Francisco12";
		numdecuenta[0] <- 123456789;
		numdecuenta[1] <- 123456788;
		numdecuenta[2] <- 987654321;
		numdecel[0] <- 121212121; // Números de celular, y apartado
		numdecel[1] <- 555987654;
		numdecel[2] <- 555456789;
		
		intentos <- 0;
		autenticado <- Falso;
		salir <- Falso;
		
		// Intentos de login
		Mientras (intentos < 3) Y No autenticado Hacer
			Escribir "Ingresar la contraseña:";
			Leer contra;
			
			Si contra = contrasenas[0] Entonces
				Escribir "Bienvenido ", usuarios[0];
				Escribir "Número de cuenta: ", numdecuenta[0];
				i <- 1;
				autenticado <- Verdadero;
			Sino
				Si contra = contrasenas[1] Entonces
					Escribir "Bienvenido ", usuarios[1];
					Escribir "Número de cuenta: ", numdecuenta[1];
					i <- 2;
					autenticado <- Verdadero;
				Sino
					Si contra = contrasenas[2] Entonces
						Escribir "Bienvenido ", usuarios[2];
						Escribir "Número de cuenta: ", numdecuenta[2];
						i <- 3;
						autenticado <- Verdadero;
					Sino
						intentos <- intentos + 1;
						Escribir "Contraseña incorrecta. Intentos restantes: ", (3 - intentos);
					FinSi
				FinSi
			FinSi
		FinMientras
		
		Si No autenticado Entonces
			Escribir "Acceso bloqueado. Se agotaron los intentos.";
			salir <- Verdadero;
		FinSi
		
		// Menú de opciones
		Mientras No salir Hacer
			// Limpia la pantalla antes de mostrar el menú
			Escribir "Seleccione una opción:";
			Escribir "1. Consultar saldo";
			Escribir "2. Retirar dinero";
			Escribir "3. Cambiar contraseña";
			Escribir "4. Consignar efectivo";
			Escribir "5. Salir";
			Leer opc;
			
			Limpiar Pantalla; // Limpia la pantalla antes de ejecutar la opción seleccionada
			Segun opc Hacer
				1:
					Escribir "Su saldo actual es: ", saldos[i];
				2:
					Escribir "Ingrese la cantidad a retirar:";
					Leer cantidad;
					Si cantidad <= saldos[i] Entonces
						saldos[i] <- saldos[i] - cantidad;
						Escribir "Retiro exitoso. Su saldo restante es: ", saldos[i];
					Sino
						Escribir "Saldo insuficiente.";
					FinSi
				 3:
					Escribir "Ingrese su nueva contraseña:";
					Leer nuevaContrasena;
					contrasenas[i] <- nuevaContrasena;
					Escribir "Contraseña cambiada exitosamente.";
				4:
					Escribir "Ingrese el monto a depositar:";
					Leer monto;
					saldos[i] <- saldos[i] + monto;
					Escribir "Depósito realizado con éxito. Su nuevo saldo es: ", saldos[i];
				5:
					Escribir "Ingrese el número de celular del destinatario:";
					Leer num_celular;
					Definir encontrado Como Logico;
					encontrado <- Falso;
					
					Para j <- 1 Hasta 3 Hacer
						Si numdecel[j] = num_celular Entonces
							encontrado <- Verdadero;
							Escribir "Ingrese el monto a transferir:";
							Leer monto_envio;
							
							Si monto_envio <= saldos[i] Entonces
								saldos[i] <- saldos[i] - monto_envio;
								saldos[j] <- saldos[j] + monto_envio;
								Escribir "Transferencia realizada con éxito a ", usuarios[j];
								Escribir "Su nuevo saldo es: ", saldos[i];
							Sino
								Escribir "Fondos insuficientes para realizar la transferencia.";
							FinSi
						FinSi
					FinPara
					
					Si No encontrado Entonces
						Escribir "Número de celular no encontrado.";
					FinSi
				6:
					Escribir "Seleccione el servicio a pagar:";
					Escribir "1. Agua";
					Escribir "2. Luz";
					Escribir "3. Internet";
					Leer servicio_opc;
					
					Segun servicio_opc Hacer
						Caso 1:
							Escribir "Ingrese el monto a pagar por el servicio de Agua:";
						Caso 2:
							Escribir "Ingrese el monto a pagar por el servicio de Luz:";
						Caso 3:
							Escribir "Ingrese el monto a pagar por el servicio de Internet:";
						De Otro Modo:
							Escribir "Opción de servicio no válida.";
					FinSegun
					
					Leer monto;
					Si monto <= saldos[i] Entonces
						saldos[i] <- saldos[i] - monto;
						Escribir "Pago realizado con éxito. Su nuevo saldo es: ", saldos[i];
					Sino
						Escribir "Fondos insuficientes.";
					FinSi
				7:
					Escribir "Gracias por utilizar el cajero. ¡Hasta pronto!";
					salir <- Verdadero;
				De Otro Modo:
					Escribir "Opción no válida. Intente nuevamente.";
			FinSegun
			
			Si No salir Entonces
				Escribir "¿Desea continuar? (S para sí, N para salir):";
				Leer continuar;
				Si continuar = "N" O continuar = "n" Entonces
					salir <- Verdadero;
				FinSi
			FinSi
		FinMientras
		
		Escribir "Programa finalizado.";
FinAlgoritmo

