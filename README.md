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

<!-- Ejercicio 1 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/P2.4/exercici1/main_ej1.dart -->
En esta app se crea un widget principal con estado donde el texto mostrado cambia dinámicamente según el botón que se pulse. El cuerpo de la pantalla es una columna centrada que contiene el texto inicial y dos botones (Morning y Night), cada uno modificando el valor de la variable text mediante setState, actualizando así el mensaje mostrado. La interfaz está construida con un Scaffold y el MaterialApp sin banner de debug, y los botones usan colores personalizados con ElevatedButton.styleFrom.

<!-- Ejercicio 2 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/P2.4/exercici2/main_ej2.dart -->
Esta app muestra un TextField donde el usuario introduce su nombre y un botón que, al pulsarlo, abre un diálogo personalizado mediante showGeneralDialog. El diálogo aparece con animación, sombra y un card elevado con bordes redondeados, mostrando "HELLO <nombre>" o un valor por defecto si el campo está vacío. La estructura usa MaterialApp con AppBar, un SingleChildScrollView para evitar problemas con el teclado, y un controlador (TextEditingController) para obtener el texto introducido antes de mostrar el saludo.


<!-- Ejercicio 3 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/P2.4/exercici3/main_ej3.dart -->
Aplicación tipo “Adivina el número” donde se genera un número aleatorio entre 0 y 100 y el usuario debe descubrirlo. La pantalla contiene título, cuadro de texto numérico, botón de validar y mensajes dinámicos según si el número introducido es mayor, menor o correcto. El control del input se hace con un TextField y la lógica de comprobación se ejecuta en la función check, que además valida rango y formato. La actualización de mensajes usa setState para reflejar los cambios en pantalla.

<!-- Ejercicio 3 v2 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/P2.4/exercici3/main_ej3_v2.dart -->
Versión ampliada del juego anterior, manteniendo la misma mecánica pero añadiendo el contador de intentos para mostrar cuántas veces el usuario ha fallado antes del acierto. Cada intento incorrecto incrementa la variable intentos y se muestra bajo el mensaje principal. Se mantienen las validaciones de rango y formato, el uso de un número aleatorio al iniciar el widget y la estructura visual centrada con título, input, botón de validar y textos informativos actualizados mediante setState.

<!-- Ejercicio 4 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/P2.4/exercici4/main_ej4.dart -->
App que simula un “dice roller” con dos dados SVG que cambian cada vez que se pulsa el botón "ROLL THE DICE". Se importa flutter_svg para mostrar las imágenes vectoriales y se usa un fondo personalizado con BoxDecoration y una capa oscurecida para resaltar los elementos. Cada dado se muestra dentro de un AnimatedSwitcher con animaciones combinadas (fade + scale), y cuando ambos caen en 6 se muestra un toast mediante Fluttertoast.showToast. Toda la lógica de actualización se gestiona con dos valores aleatorios generados en _rollDice.


<!-- Ejercicio 5 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/P2.4/exercici5/main_ej5.dart -->
Se crea una interfaz simple para llevar la puntuación de dos equipos mediante dos variables (teamA y teamB) que se incrementan al pulsar sus respectivos botones. El body contiene una columna con separadores, mostrando primero las puntuaciones en una fila y después los dos botones estilizados con bordes redondeados y color azul gris. Cada pulsación actualiza su contador usando setState, refrescando los valores visibles. Toda la app se construye con un MaterialApp y un Scaffold sin AppBar, dejando solo el marcador y los botones en pantalla.

<!-- Ejercicio 6 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/P2.4/exercici6/main_ej6.dart -->
Aplicación de lista de la compra donde el usuario puede añadir elementos introduciendo nombre y cantidad, ambos recogidos mediante TextEditingController en una tarjeta superior (_buildInputCard). La app valida que el nombre no sea vacío y que la cantidad sea un número mayor que cero, mostrando un SnackBar si la entrada no es válida. Los elementos se almacenan en la lista _items y se renderizan con un ListView.builder, donde cada fila muestra el nombre a la izquierda y la cantidad dentro de una caja estilizada a la derecha. Incluye organización del layout con SafeArea, sombras, colores personalizados y limpieza automática de los campos al añadir un item.


<!-- Ejercicio 7 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/P2.4/exercici7/ -->
En este proyecto se introduce el uso de Provider creando una app con 3 pestañas que comparten el mismo estado global. En main_ej7.dart se envuelve la app con un ChangeNotifierProvider que expone un CounterProvider (un ChangeNotifier con un contador _counter y un método increment() que llama a notifyListeners()). La pantalla principal (HomeScreen) es un StatefulWidget con un BottomNavigationBar de 3 botones que cambian el índice actual y muestran una de las tres páginas (Page1, Page2, Page3). En Page1 se ve el valor del contador y un botón “Sumar” que llama a context.read<CounterProvider>().increment(), mientras que Page2 y Page3 solo muestran el mismo contador usando context.watch<CounterProvider>(). Así se demuestra que al modificar el contador en una pestaña, las otras también se actualizan automáticamente gracias al estado compartido por Provider.

<!-- Ejercicio 8 -->
<!-- Ruta: flutter-stateless-mascaro-serrano/lib/cat/bemen/dam/0488/ra2/P2.4/exercici8/ -->
Este ejercicio parte de la base del Ejercicio 7 y la amplía para montar una app “hub” que agrupa todos los ejercicios anteriores en diferentes pantallas usando Provider, bottom navigation y pestañas. En main_ej8.dart se vuelve a envolver la app con ChangeNotifierProvider y un CounterProvider, pero ahora el HomeScreen muestra 2 pestañas principales a través de un BottomNavigationBar: una página para ejercicios Stateless (StatelessPage) y otra para ejercicios Stateful (StatefulPage). Cada una usa un DefaultTabController con TabBar y TabBarView para navegar entre varias subpáginas (stateless_ex1…stateless_ex6 y stateful_ex1…stateful_ex6/v2), donde se reutiliza y organiza el código de los ejercicios anteriores (hello world, diálogos, adivina el número, dados, marcador, lista de la compra, etc.), algunos apoyados en el CounterProvider para compartir estado. Además se configura un tema con ColorScheme.fromSeed y Material3, de forma que este proyecto sirve como introducción práctica a cómo estructurar una app más grande con varias ventanas, navegación combinada (tabs + bottom bar) y un estado global gestionado con Provider.


