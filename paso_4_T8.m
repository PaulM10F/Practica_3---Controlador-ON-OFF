% Ejecutamos la simulacion
out = sim('paso_4');

% Extraemos los datos del PID inicial
r_ini = out.r_out.Data;
y_ini = out.y_out.Data;
u_ini = out.u_out.Data;

% Cálculos del PID Inicial
ecm_inicial = mean((r_ini - y_ini).^2);
umax_inicial = max(abs(u_ini));

% Extraemos los datos del PID Sintonizado
r_fin = out.r_out1.Data;
y_fin = out.y_out1.Data;
u_fin = out.u_out1.Data;

% Cálculos del PID Sintonizado
ecm_final = mean((r_fin - y_fin).^2);
umax_final = max(abs(u_fin));

% Creamos la tabla
Estado_de_Simulacion = {'PID Inicial'; 'PID Sintonizado'};
Ganancias_ingresadas = {'Kp=10, Ki=20, Kd=0'; 'Kp=15, Ki=30, Kd=0.05'};
Error_Cuadratico_Medio_ECM = [ecm_inicial; ecm_final];
Esfuerzo_Maximo_Actuador = [umax_inicial; umax_final];

disp('COMPARACIÓN DE PID')
Tabla_PID = table(Estado_de_Simulacion, Ganancias_ingresadas, Error_Cuadratico_Medio_ECM, Esfuerzo_Maximo_Actuador)