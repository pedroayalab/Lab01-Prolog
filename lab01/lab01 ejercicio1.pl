% Hechos: relación entre ciudades
ciudad(bogota).
ciudad(medellin).
ciudad(cali).
ciudad(cartagena).
ciudad(manizales).
ciudad(barranquilla).
ciudad(pasto).
ciudad(monteria).
% Hechos: vuelos directos
vuelo(bogota, medellin).
vuelo(medellin, cartagena).
vuelo(cali, bogota).
vuelo(bogota, cartagena).
vuelo(manizales, cartagena).
vuelo(medellin, barranquilla).
vuelo(pasto, bogota).
vuelo(bogota, pasto).

%reglas
%Dada la base de conocimiento de vuelos, define una regla que:

%Determine si dos ciudades están conectadas mediante una escala.
escala(X,Y):vuelo(X,Z),vuelo(Z,Y).

%Ahora, verifica si existe una conexión de Bogotá a Barranquilla.
% ?-escala(bogota,barranquilla). : true.

%Encuentra todas las ciudades a las que se puede llegar desde Cali con una escala.
% ?-escala(cali,X). :medellin,cartagena,pasto

%Define una regla viaje que sea cierta si existe un vuelo directo o con una escala entre dos ciudades (no usar recursion).
alcanza(X,Y) :- vuelo(X,Y).
alcanza(X,Y) :- escala(X,Y).

%Ahora, verifica si existe un viaje posible de Bogotá a Pasto.
% ?-alcanza(bogota,pasto). : true

%Define una regla destinos que devuelva todos los destinos alcanzables directamente desde una ciudad.
?-vuelo(_,X)

%nuevo conocimientos

perro(firulais).
perro(bruno).
perro(max).
gato(misu).
gato(luna).
gato(chanel).
gato(orion).
ave(piolin).

dueno(ana, firulais).
dueno(ana, misu).
dueno(luis, luna).
dueno(luis, orion).
dueno(luis, firulais).
dueno(maria, piolin).
dueno(julia, chanel).
dueno(pedro, bruno).

Responde:

%Define una regla que determine si una persona tiene un perro.
tienePerro(X,Y):- perro(Y),dueno(X,Y).

%Ahora, encuentra los dueños de perros.
?-tienePerro(X,_). :ana,luis,pedro

% Define una regla que determine si una persona tiene un gato.
tieneGato(X,Y):-gato(Y),dueno(X,Y).

%Ahora, encuentra los dueños de gatos.
?-tieneGato(X,_). : ana,luis,julia

%Define una regla que determine si una persona tiene multiples mascotas.
tieneMultiples(X):-dueno(X,Y),dueno(X,Z), Y\=Z.

% Ahora, encuentra los dueños de multiple tipos de mascota.
?-tieneMultiples(X). : ana,luis

%Define una regla amante_animales para identificar dueños que tienen tanto perro como gato.
amante_animales(X):-dueno(X,Y),dueno(X,Z),perro(Y),gato(Z).

%Define una regla mascota_compartida que indique si dos personas comparten mascota.
mascota_compartida(Y,Z):-dueno(Y,X),dueno(Z,X), Y \=Z.

%Define una regla tipo_mascota que asocie una persona con el tipo de mascota que tiene (perro, gato, ave, etc.).
tipo(P,perro):- tienePerro(P).
tipo(P,gato):-tieneGato(P).
tipo(P,ave):-tieneAve(P).