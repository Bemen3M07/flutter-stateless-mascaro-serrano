[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/XRrsqZ_g)

P2.3


<!-- Ejercicio 1 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/p3/exercici1/main1.dart -->
Documentación:
Proyecto base, crea un widget con un solo body centrado y este solo tiene un child que en este caso es el texto: 'Hello World 1!'
Para ejecutar un metodo main que corre la app.

<!-- Ejercicio 2 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/p3/exercici2/main2.dart -->
Documentación:

Proyecto base, crea un widget con un solo body que ocupa todo el espacio (SizedBox.expand) y dentro usa un Builder para obtener un BuildContext interior (necesario para mostrar SnackBar con ScaffoldMessenger.of(innerContext)). El body contiene una Column centrada verticalmente con dos Text, separador (SizedBox) i dos ElevatedButton (Login i Register). Al pulsar cada botón se muestra un SnackBar distinto (texto y duración 2s). Los botones usan ElevatedButton.styleFrom per ajustar colors (backgroundColor: Colors.teal, foregroundColor: Colors.white).
Para ejecutar, define el main() que fa runApp(const MainApp()) i un StatelessWidget que construeix el MaterialApp i el Scaffold.

<!-- Ejercicio 3 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/p3/exercici3/main3.dart -->
Documentación:
En esta app creamos un solo widget que contiene un cuerpo con un child que contiene como children una imagen y un texto.
La separaciión entre texto e imagen la definimos con la altura del SizedBox y la imagen la definimos con la ruta ('assets/img/mono.png') y el ancho que ocupa (120).

Para esta app hemos tenido que añadir al pubsec.yaml la ruta de la carpeta que contiene las imagenes: 
flutter:
  uses-material-design: true
  assets:
    - assets/img/

<!-- Ejercicio 4 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/p3/exercici4/main4.dart -->
Documentación:

En este caso, se define la clase Contacto (atributos: nombre, email, tel) y crea un widget con un único body que ocupa todo el espacio (SizedBox.expand). Dentro usa un Builder y una Column centrada que muestra: una CircleAvatar con la imagen desde assets (assets/img/mono.png), el nombre en un Text con estilo (tamaño y negrita) y una Container gris con padding que contiene el email y el tel en dos filas (Row) acompañadas de sus íconos. Utilizamos la modificacion del pubsec.yaml anterior para la imagen. Para ejecutar, define main() que haga runApp(const MainApp()) y un StatelessWidget que construya el MaterialApp y el Scaffold.

<!-- Ejercicio 5 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/p3/exercici5/main5.dart -->
Documentación:
En esta app crearemos una clase fuera del mainApp que será la constructora del mensaje el cual generará el objeto mensaje con un nombre y un texto (body).

En el main crearemos el widget y dentro de el definiremos un array con todos los nombres, la constante body con el texto y la variable mensaje que crea el mensaje de cada tarjeta llamando a la funcion anterior. 

El materialApp contiene el unico body que contiene tarjetas (la cantidad de tarjetas es la cantidad de mensajes generados, osea de nombres), y estas tarjetas tiene definido el color, padding, y su estructura interna con una columna que contiene el nombre y texto de esa tarjeta. También definimos el formato de la letra del nombre y la separación con el texto.

<!-- Ejercicio 6 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/p3/exercici6/main6.dart -->
Documentación:

Por ultimo, parte de la app del Exercici 5 (lista de mensajes). Añade una AppBar superior (títol centrat i icones visuals sense funcionalitat) i una barra inferior (BottomAppBar o BottomNavigationBar) també sense funcionalitat. Mantén el ListView.builder amb les Card dels missatges i el FloatingActionButton. 
Para ejecutar, define el main() que haga runApp(const MainApp()) i un StatelessWidget que construeixi el MaterialApp, el Scaffold amb appBar, body, floatingActionButton i bottomNavigationBar/bottomAppBar.


P2.4

