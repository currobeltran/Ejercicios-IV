# Ejercicios Tema 1

## Ejercicio 1 

### Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Visitando varios enlaces, podemos observar que los precios de los servidores varían considerablemente dependiendo de su potencia. En este ejercicio pondremos como ejemplo un [Lenovo ThinkServer TS150](https://www.amazon.es/Lenovo-ThinkServer-TS150-3-3GHz-E3-1225V6/dp/B074YG8L61/ref=sr_1_12?dchild=1&pf_rd_i=938009031&pf_rd_p=3e8da6a7-a77f-5389-9030-ccd5fefe4492&pf_rd_r=3VW6JH5B3NP6PMVX80Y1&pf_rd_s=merchandised-search-10&pf_rd_t=BROWSE&qid=1600786671&refinements=p_72%3A831280031&s=computers&sr=1-12) que ronda los 1500€ euros y que está recomendado según su descripción como un primer servidor para pequeñas y medianas empresas. 

Según el enlace proporcionado, la amortización del servidor anterior a cuatro años sería de 375€ al año y a siete de 214.29€.

## Ejercicio 2

### Usando las tablas de precios de servicios de alojamiento en Internet “clásicos”, es decir, que ofrezcan Virtual Private Servers o servidores físicos, y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa solo el 1% o el 10% del tiempo.

El servicio de VPS que vamos a utilizar para esta comparación será el ofrecido por [arsys.es](www.arsys.es), con las siguientes características:

- Procesador 4 vCPU Intel Xeon
- Memoria RAM 8GB
- Almacenamiento 100GB SSD

Precio: 20€/mes, que en total a lo largo de un año serían 240€.

Para el servicio en la nube hemos buscado en la página anterior un servidor de las mismas características, siendo el precio resultante al mes de 99€.

Como el servicio en la nube no se va a utilizar el 100% del tiempo y el precio depende del uso que se le dé mensualmente, recalcularemos ese precio para hacernos una idea más precisa de la comparativa:

- En el caso de que el uso sea del 1%, el precio mensual sería de 0,99€/mes. A lo largo de todo un año el precio sería de 11,88€.
- En el caso de que el uso sea del 10%, el precio mensual sería de 9,90€/mes. A lo largo de todo un año el precio sería de 118,8€.

Como podemos observar, si contratamos un servicio cloud que no tenga un gran uso podemos ahorrar respecto a la opción de un VPS, que es un precio fijo.

## Ejercicio 3

### En general, cualquier ordenador con menos de 5 o 6 años tendrá estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden? Si usas una máquina virtual, ¿qué resultado da? ¿Y en una Raspberry Pi o, si tienes acceso, el procesador movil?

El modelo de procesador utilizado en este ejercicio es un intel core i7 de 6 generación; y como salida a la orden "**egrep '^flags.*(vmx|svm)' /proc/cpuinfo**" se generan las siguientes líneas:

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx

Esto quiere decir que la virtualización está activa en nuestro ordenador (al ser un procesador Intel la tecnología usada para tal efecto será VT-x. Esto se puede comprobar en Linux a través del comando lscpu, el cual en una de sus salidas indica que tipo de virtualización utiliza nuestro procesador).

Al realizar la misma prueba en una máquina virtual no se despliega ningún resultado, ya que en un entorno virtualizado solo el anfitrión tiene la capacidad de virtualizar recursos; por tanto la máquina invitada no tendrá activados dichos flags.

## Ejercicio 4

### Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios. Usar siempre que sea posible un hipervisor que sea software libre.

El hipervisor instalado para gestionar máquinas virtuales será Oracle VirtualBox. Lo instalaremos en un sistema operativo ArchLinux, por lo tanto tendremos que ejecutar el siguiente comando desde la terminal, que instalará los paquetes necesarios para utilizar esta herramienta: "**sudo pacman -Syu virtualbox linux54-virtualbox-host-modules**" (el último paquete será el correspondiente a la versión del kernel de Linux que estemos utilizando, en este caso el 5.4). 

También debemos añadir nuestro usuario al grupo de usuarios de VirtualBox para acceder a todas las funcionalidades del software. Para ello, tendremos que ejecutar el siguiente comando: "**sudo gpasswd -a $USER vboxusers**"

## Ejercicio 5

### Darse de alta en una web que permita hacer pruebas con alguno de los sistemas de gestión de nube libres como los mencionados en los párrafos anteriores, aunque sea temporalmente. Si la prueba es menos de un mes, simplemente anotarlo y dejarlo para el mes de diciembre, más o menos.

Para este apartado podemos usar Google Cloud Platform, pero al existir una prueba gratuita de solo 3 meses aun no he realizado el registro para comenzar su uso.