## Expositores

## Presentación de los asistentes

## ¿Qué es una CMDB?

## ¿Qué es iTop?

## Recorrido por la interfaz

## Requerimientos

## Intalación

## Implementación

## Extensiones

## iHub

## Contacto



### 1. Expositores

    • Jorge Antonio Díaz Lara
      *Jefe de Departamento de Seguridad Informática de la Cámara de Diputados 
      * Más de 25 años de trayectoria 
      
    • Miriam Alejandra Álvarez Montiel
      * Blue Team y monitoreo de la Cámara de Diputados
      * 7 años en el área de TI y los últimos 2 años en el área específica de ciberseguridad 

### 2. Presentación de los asistentes y espectativas (¿que saben sobre CMDB?)

### 3. ¿Qué es una CMDB?

Es una Base de Datos de la Gestión de Configuración (CMDB, Configuration Management DataBase), el cual es un concepto que introduce el ITIL-ISO 20000 para facilitar la gestión de los servicios TI. Se define como una base de datos donde administrar y gestionar todos los elementos de una compañía en cuestiones de TI que son necesarios para la prestación de servicios. Ésto involucra tanto a los elementos TIC,como los servicios de proveedores , software, personas, documentación, etc.

No sólo se trata de un repositorio donde se almacenan elementos, si no que su característica principal  es la interrelación de todos los elementos, lo que permite seguir de un elemento inicial a uno final a través de las relaciones que existen entre cada uno de ellos.

Dentro de los controles CIS que abarca el manejo de una CMDB se encuentran dos de la categoría Básica, como:

Control 1: Inventario y control de dispositivos hardware
Control 2: Inventario de software autorizado y no autorizado

Dentro de la norma ISO/IEC 27001- 2020  en sus objetivos y controles marca lo siguiente:

A.8 Gestión de activos
A.8.1 Responsabilidad por los activos
A.8.1.1 Inventario de activos
Control: La información y otros activos asociados a la información y a las instalaciones de procesamiento de la información deben ser identificados y se deben mantener y realizar un inventario de dichos activos.
A.8.1.2 Propiedad de los activos
Control: Los activos que se mantienen en inventario deben tener un dueño

El marco de seguridad de NIST establece en su área de de identificación establece que varias publicaciones.

### 4. ¿Qué es iTop?

Es una aplicación web Open Source para el día a día de las operaciones de un entorno TI que tiene la finalidad de gestionar la complejidad de las infraestructuras compartidas. Fue creado tomando en cuenta el estandar ITIL para las buenas prácticas con el objeto de mejorar la gestión y provisión de servicios TI. Es flexible para adaptarse a los procesos y necesidad que la organizaciones y a la vez gestionar múltiples clientes, contratos y SLA.

¿Por qué seleccionar iTop?

    • Es de uso gratuito
    • Proceso de configuración del software sencillo
    • Se puede personalizar de la forma que se necesite para pequeñas y medianas empresas
    • Los paneles de gestión se pueden personalizar fácilmente
    • Las funciones de importación y exportación son flexibles y permiten ajustes.
    • Variedad de funciones
    • Módulos basados en ITIL
    • Manejo de incidentes, problemas y cambios
    • Herramienta lista para la automatización
    • Integración de API
    • Capacidad de generación de informes
    • Soporta los principales procesos ITIL
    • Buen manejo de inventariado

### 5. Recorrido por la interfaz

¿Qué elementos de configuración son representados en la CMDB?

    • Acces point
    • Aplicacion Web
    • Core Switch
    • DB Cluster
    • Dispositivo de Red
    • Enclosure
    • Enlace WAN
    • Escáner
    • Esquema de Base de Datos
    • Firewall
    • Fuente de Poder
    • Granja
    • Hypervisor
    • Impresora
    • Instalación de Middleware
    • Librería de Cintas
    • LoadBalancer
    • Middleware
    • Middleware Cluster
    • Máquina Virtual
    • NAS
    • NoBreak
    • Número AS
    • Otro Software
    • PC/Laptop
    • PDU
    • Pantalla TV
    • Periférico
    • Proceso de Negocio
    • Proyector
    • Rack
    • Router
    • Servidor
    • Servidor Web
    • Servidor de Base de Datos
    • Sistema de Almacenamiento
    • Software de PC
    • Solución Aplicativa
    • Switch Acceso
    • Switch Distribución
    • Switch NAS
    • Switch SAN
    • Tableta
    • Teléfono
    • Teléfono IP
    • Teléfono Móvil
    • VRF
    • WebApp Cluster

¿Para qué otras actividades me sirve la CMDB?

    • Administración de Ips
    • Administración de DNS
    • Administración de Requerimientos
    • Requerimientos IP
    • Administración de Incidentes
    • Administración de Problemas
    • Administración de Cambios
    • Administración de Servicios
    • Administración de Datos

¿Cuáles son las soluciones de Software Libre y OpenSource que existen?

    • OTRS
    • OneCMDB
    • Rapid OSS
    • ECDB
    • i-doit
    • CMDBuild

### 6. Requerimientos

Requerimientos mínimos de hardware

| Tickets creados por mes | Usuarios de consola | CMDB:CIs | Servidores | CPU | Memoria | Disco para MySQL |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ------------ |
| <200 | <20 | 50k | Un servidor todo en uno | 20vCPU | 4Gb | 10Gb |
| <5000 | <50 | <200k | Dos servidores:Web + MySQL | 4vCPU | 8Gb | 20Gb |
| <5000 | >50 | >200k | Dos servidores:Web + MySQL | 8vCPU | 16Gb | 50Gb |

El tamaño de pantalla mínimo para usar iTop es de 1024 * 768 píxeles, pero cuanto mayor sea la resolución, mejor.

Se recomienda utilizar máquinas virtuales que ejecuten Debian 9 o Ubuntu 20.04 LTS.

Requerimientos de software

Servidor iTop

iTop está basado en MySQL y PHP

    • Servidor Web: Apache e IIS tiene una configuración incorporada, otros servidores web requieren trabajo adicional.
    • Se requiere Graphviz para mostrar el gráfico de análisis de impacto.
    • Extensiones PHP requeridas: ctype, dom, iconv, json, mbstring, mysqli,soap.
    • Php-gd es opcional pero se requiere para poder agregar imágenes con CKEditor y cambiar el tamaño de las imágenes automáticamente dentro de los campos HTML.
    • Verificar los datos cifrados para saber qué instalar en el atributo EncryptedString.
    • Para seleccionar una versión de la base de datos se sugiere consultar las notas de la versión de Maria DB por versión y las notas de la versión de MySQL.

| iTop | PHP | MySQL | MariaDB | Limitaciones | 
| ----------- | ----------- | ----------- | ----------- | ----------- | 
| 2.7.x | 5.6-7.4 | 5.6-5.7 | 10.1-10.4 | MySQL 8 no se recomienda para bases de datos grandes,Compatible con PHP 7.4,IE9 ya no es compatible |
| 3.0.x | 7.1.3-7.4 | 5.7 | 10.3 | 4vCPU | MariaDB es más recomendado que  MySQL, IE11 ya no es compatible, PHP 8 ya no es compatible |

Leyenda:

En negrita: cuando la versión mínima requerida ha cambiado en comparación con la versión anterior
En cursiva: La versión más alta admitida, cuando se conoce.

Web Browser

Se recomienda la última versión de Chrome (Firefox es seguro también)
Desde 2.7.0, IE9 ya no es compatible.

### 7. Instalación (script)

### 8. Implementación

Creando nuevos objetos en iTop

    • Desde CSV import: Si tu deseas crear muchas instancias de la misma clase de objetos, comúnmente es más fácil importarlos desde un documento de datos existentes. La herramienta CSV import, en el menú “Data Administrator”, está diseñada para ésto. Prepara tus datos en formato CSV: como un archivo de texto, con un objeto por línea y valores separados por un carácter fijo (punto y coma, coma o tabulador). Entonces, con el Asistente de CSV import se puede cargar el archivo en iTop.
    • Desde el Universal Search: para crear un nuevo objeto de cualquier clase, usa el menú “Universal Search” en la sección “Admin Tools”. Lleva a cabo una búsqueda por objetos de esta clase, una el menú emergente “Actions / New…” para crear una nueva instancia de la clase.

Gestión de la Configuración

Creando organizaciones

Cuando se planea un despliegue de iTop, la primer decisión que se debe tomar es sobre la estructura de las Organizaciones. En iTop, las Organizaciones se usan para dos propósitos principales: la descripción de clientes y entidades proveedoras y el particionamiento de los datos, desde el punto de vista de seguridad. Casi todos los objetos cargados en iTop tienen una relación con una Organización,  por lo tanto es importante crear una estructura adecuada de Organizaciones antes de cargar otros objetos desde del iTop.

Entendiendo clientes y proveedores

En iTop, no hay nada como un “cliente” o un “provedor”, solo hay Organizaciones. Como en la vida real, ya sea que una Organización sea un cliente o un proveedor depende del punto de vista. Por ejemplo la Organización “Company a” puede ser un cliente de “Compañía B” y al mismo tiempo se un proveedor de “Company C”. La relación cliente/proveedor en iTop son representadas usando Contratos. “Company A” es un cliente de “Company B” si hay un Contrato de Cliente con “Company B” como el proveedor y “Company A” como el cliente.

¿Cuál es la diferencia entre Contratos de Clientes y Contratos de Proveedores?

Un Contrato de Proveedor es una versión ligeramente simplificada de el Contrato de Cliente, con dos limitaciones.

    • Un Contrato de Proveedor no está relacionado a ningún servicio desde el catálogo de servicios.
    • El Acuerdo de Nivel de Servicio es documentado como un campo de texto libre en los Contratos de Proveedor y por lo tanto no puede ser usado para cálculos automatizados en iTop.

Los Contratos de Proveedores son útiles para documentar contratos con proveedores externos ( llamados contratos de sustento en la terminología de ITIL), para los cuales no se rastrearán tickets en iTop.

Por supuesto que puedes usar los Contratos de Clientes para describir la relación contractual con los proveedores externos, pero esto significa que también tienes que documentar en iTop los catálogos de servicio de éste externo.

Organizaciones y derechos de acceso

Aparte de la relación de los clientes/proveedores, otra razón para crear varias Organizaciones en iTop es para restringir el acceso a algunas áreas de los datos gestionados.

En iTop los derechos para “leer” (o mostrar) objetos de la base de datos se definen por Organización. A cada usuario se le da (en la definición de su cuenta)los derechos para accesar a un set de Organizaciones.

Las Organizaciones pueden ser estructuradas como una jerarquía. Cuando éste es el caso, los derechos de acceso son heredados desde la Organización “padre” a las Organizaciones “hijo”. Por ejemplo, Si “Company A” tiene dos Organizaciones hijo: “Company A1” y “Company A2”, entonces si un usuario tiene los derechos para accesar a los objetos en “Company A”, también tiene permisos para accesar a los objetos en “Company A1” y “Company A2”, Por otro lado, un usuario que tiene los permisos para accesar solo a “Company A1” no está habilitado para accesar a ningúno de los objetos en “Company A” ni tampoco en “Company A2”.

Los derechos para “escribir”( por ejemplo, crear, modificar o borrar) objetos son definidos solo por el perfil(es) asignados a la cuenta de usuario. Por ejemplo el perfil “Support Agent” da los derechos para crear o modificar tickets de solicitud de usuario (pero no borrarlos). Ésto significa que un usuario tiene los mismos derechos de acceso sobre todas las Organizaciones a las que se le permite acceder.

Por ejemplo, en una versión anterior de iTop, un usuario no puede tener los derechos de acceso a los datos de las Organizaciones “Company A” y “Company B” y los derechos para crear Servidores solo en “Organization B”. Si se le dan los derechos para crear Servicores, esto podría aplicar para ambos “Company A” y “Company B”

Creando Ubicaciones

Las Ubicaciones son muy útiles para agrupar objetos por geografía. Incluso si el atributo de la ubicación no es un campo obligatorio cuando tu creas un CI en la CMDB, es fuertemente recomendado crear Ubicaciones de antemano y realizar un seguimiento de las ubicaciones de todos los Cis.

Cuidadosamente planea la creación de las Ubicaciones. Las Ubicaciones son difíciles de identificar (comúnmente no hay un identificador único aceptado para una Ubicación), si tu compañía no tiene una ya, es posible que desees establecer una nomenclatura convencional para evitar ubicaciones duplicadas en la CMDB.

Ubicaciones compartidas

En ambientes de empresa, a pesar que la división de roles y responsabilidades son en favor de crear varias sub Organizaciones, frecuentemente se necesita tener ubicaciones “compartidas” entre varias Organizaciones para documentar las “Ubicaciones conjuntas”. iTop no proveé- es ésta versión estándar- una forma de “compartir” objetos entre Organizaciones. Sin embargo, las Ubicaciones son “heredadas”desde Organizaciones padre a Organizaciones hijo de la misma manera como los derechos de acceso. Ésto significa que una Persona, un Servidor o un Network Device que pertenencen a “Company A2” pueden localizarse en un Ubicación  propiedad de “Company A”.

Creando Personas

Las Personas son muy impotantes en iTop ya que son usadas para definir todos los contactos y sus responsabilidades. Una persona pertenece a una y solo una organización. Una persona puede ser un miembro de uno o más equipos, y  por lo tanto debe crearse antes de intentar configurar Equipos.

También, cada registro de usuario es ligado a un objeto Persona. Por lo tanto Persona debe de crearse antes de cargar las cuentas de usuario dentro del iTop. El registro de usuario define los derechos de acceso ( y el método de identificación), mientras que el objeto Persona define la información sobre el contacto: nombre, ubicación, dirección de correo, teléfono…

Creando Equipos

Los equipos están ligados a varios tipos de objetos, como contratos o tickets, para definir responsabilidades. Los equipos también son usados como “equipos de trabajo”para asignar tickets. Los equipos usados para asignar tickets también deben tener al menos un miembro ( el agente a quién asignar el ticket). El atributo “Role” en el enlace entre un Equipo y una Persona no es obligatorio, puedes dejarlo vacío, pero es útil para definir el role de la Persona en el Equipo (Lider de Equipo, Gerente...)

Dispositivos y Software CI

Una vez que la estructura de las Organizaciones, las Ubicaciones y los contactos (Equipos y Personas) han sido cargadas, puedes empezar a llenar la CMDB.

Dado que las instancias de software dependen de los tipos de software definidos en los catálogos de software y están documentados como instalados en un host particular, deberías empezar por documentar:

    • La infraestructura física: Servidores, Dispositivos de red, PCs, etc.
    • El catálogo de software, creando el tipo necesario de objetos “Software”

Gestión de Servicios

Antes de gestionar tickets en iTop, se debe definir el catálogo de  servicios, los Modelos de Entrega y los contratos.

Catalogo de Servicios

El “Catálogo de Servicios” es la lista de Servicios que están disponibles desde una Organización proveedora dada. El Catálogo de Servicios es documentado en iTop creando objetos Servicio, asignándolos a la Organización dada (considerada como la proveedora de los servicios). Los servicios son organizados en dos niveles de jerarquía, a través de dos clases de objetos:
Servicio y Subcategoría de Servicio. Cree los servicios de nivel superior antes de cargar las subcategorías.

El tercer nivel “Familia de servicios” es usado para agrupar Servicios juntos y es obligatorio para el Enhanced Portal.

Una vez que el catálogo de servicios (Servicios y  Subcategorías de Servicio) es definido, crear los Contratos de Clientes qye podrían vincularse con cada Organización “cliente” con sus proveedores creando un Contrato “Cliente” por cada par de proveedor /cliente y vincular el Servicio apropiado para el contrato.

Modelo de entrega

El modelo de entrega es el objeto que define qué equipo trabaja para qué cliente. Puede utilizar un objeto de modelo de entrega para agrupar a todos los "equipos de soporte" para un conjunto determinado de servicios, o los equipos de soporte dedicados a un cliente en particular. A cada organización cliente se le debe asignar un solo modelo de entrega. 

En el modelo de datos estándar de iTop 2.0, no existe un vínculo entre Teams y Services. La única limitación a la hora de asignar un ticket a un Equipo es que el Equipo debe ser parte del Modelo de Entrega asignado a la Organización que es cliente del ticket. 

Por ejemplo, si tiene los siguientes equipos:

    Equipo de asistencia técnica: un equipo que procesa todas las solicitudes / llamadas de asistencia técnica.
    Equipo de soporte de MS Office: un equipo que procesa todas las solicitudes de soporte sobre MS Office.
    Equipo de soporte de hardware: un equipo que maneja las llamadas de hardware (reemplazos, nuevos pedidos de hardware)
    Equipo de soporte de red: un equipo que maneja problemas relacionados con la red.
    Equipo de asistencia técnica del cliente B: un equipo de asistencia técnica dedicado al cliente B
    Equipo de hardware del cliente B: un equipo que maneja las llamadas de hardware del cliente B

A continuación, puede crear dos modelos de entrega diferentes:

    "Modelo de entrega 1" compuesto por:
        Equipo de asistencia técnica
        Equipo de soporte de MS Office
        Equipo de soporte de red
    "Delivery Model 2" compuesto por:
        Equipo de asistencia técnica del cliente B
        Equipo de hardware del cliente B
        Equipo de MS Office

El "Modelo de Entrega 1" será utilizado por las Organizaciones "Cliente A", "Cliente A1", "Cliente A2" y "Cliente C"; mientras que el “Modelo de entrega 2” será utilizado por el “Cliente B”. 

Acuerdos de nivel de servicio y objetivos

La definición de acuerdos de nivel de servicio (SLA) y objetivos de nivel de servicio (SLT) no es obligatoria para administrar tickets en iTop, pero sin ellos iTop no puede calcular los plazos para procesar un ticket ni escalar el ticket automáticamente.

Para calcular si se respetan o no los acuerdos de nivel de servicio esperados, iTop presenta dos posibles tipos de métricas llamadas SLT (objetivos de nivel de servicio):

TTO (Time To Own): el tiempo entre la creación de un ticket y su asignación a un Agente.
TTR (Time To Resolve): el tiempo entre la creación de un ticket y su resolución (es decir, medido cuando el ticket entra en el estado "resuelto")

Un SLT define una duración asociada con:

Una métrica: TTO o TTR
Un tipo de ticket (incidente o solicitud del usuario)
Una prioridad (dado que los tickets con mayor prioridad generalmente deben procesarse más rápidamente)

Un SLA se define simplemente como un grupo con nombre de SLT (por ejemplo, para distinguir entre los niveles de servicio "Gold" y "Silver").

La definición de SLA / SLT tiene dos efectos en iTop:

Las notificaciones se pueden definir para cualquier porcentaje del "umbral" asociado con una de las métricas (por ejemplo, se pueden configurar notificaciones para enviar un correo electrónico al agente que trabaja en un ticket cuando se alcanza el 50% del tiempo de resolución y al equipo líder al llegar al 75%).
Cuando se alcanza el 100% de una métrica, el ticket se establece automáticamente en un estado especial de "escalamiento" (hay dos estados específicos definidos en el ciclo de vida de los tickets: escalamiento TTO y escalamiento TTR). Entrar en tal estado también se puede utilizar para activar notificaciones específicas.

Esto conduciría a la creación de 4 SLT, uno para cada fila de la tabla. Estos 4 SLT se pueden agrupar en un SLA denominado "Nivel de servicio Gold".

Finalmente, los SLA se pueden asociar a los Contratos del Cliente para definir las métricas aplicables al contrato. 

### 9. Extensiones

### 10. Contratos

### 11. iHub (Descarga e instalación de alguna de las extensiones)

### 12. Contacto

### 13. Gracias
