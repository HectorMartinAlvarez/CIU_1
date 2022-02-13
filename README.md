# CIU - Práctica 1

Autor: Héctor Miguel Martín Álvarez

Recreación del videojuego Pong para 2 jugadores realizada en processing

## Desarrollo

El proyecto ha sido desarrollado en un único fichero, en el cual se han implementado distintos métodos para controlar que se muestra por pantalla, los limites y las posiciones de los jugadores y la bola, la condición de victoria, la condición de haber anotado un punto y los eventos relacionados con las pulsaciones de las distintas teclas.

## Caracteristicas

  - Música de fondo durante todo el juego.
  - Menú principal en el que muestran los controles para seleccionar entre 2 opciones "Start" y "Exit", iniciar y salir del juego respectivamente.
  - PreJuego (PreGame)
    - Pantalla informativa antes de comenzar el juego.
    - Visualización de los controles empleados durante el juego.
    - Visualización de las posiciones de cada jugador (izquierda jugador 1 y derecha jugador 2).
    - Visualización de la dirección de la bola al comienzo de la partida.
    - Cuenta atrás para el comienzo de la partida un vez que ambos jugadores han indicado que estas listos (Z - jugador 1 y M - jugador 2).
      - Posibilidad de cancelar el comienzo de la partida durante la cuenta atrás
  - Juego
    - Durante la partida los controles de los jugadores son ocultados para mejor visibilidad.
    - En la parte superior de cada mitad de la pantalla se muestra la puntuación actual del jugador del lado correspondiente (izquierda jugador 1 y derecha jugador 2).
    - Distinto efectos de sonido para la colisión entre un jugador y la bola, entre la bola y el limite superior e inferior y al anotar un punto.
    - El primer jugador en alcanzar 6 punto gana la partida y se muestra la pantalla final.
  - Fin del Juego (Pantalla final)
    - Muestra que jugador ha ganado la partida.
    - Da la posibilidad de reiniciar el juego (R - Reiniciar).

## Herramientas

  - Processing 3.5.4
  - Audacity

## Referencia

  - Material de la asignatura Creando Interfaces de Usuario
  - Documentación de Processing
  - Efectos de sonido extraídos del videojuego Arkanoid
  - Musica de fondo extraída del videojuego Mega man 3
   

![Error showing gif :(](https://github.com/HectorMartinAlvarez/CIU_1/blob/main/animacion.gif)
