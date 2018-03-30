    <?php
     
        # Clase Conection que se encarga de realizar la conexion con la base de datos usando PDO
        class Conection {
     
            # Funcion estatica que devuelve la conexion si no encuentra ningun error
            static public function connect() {
     
                # Traemos de otro directorio protegido de lectura y escritura los datos de conexion a la base de datos
                include "config/config.php.ini";
     
                # Realizamos un try and catch (prueba y captura del error).
                # Si la prueba es verdadera ejecuta el codigo que hay en su interior: realiza la conexion con la base de datos y lo devuelve como valor del metodo
                # Si da error mostrara en pantalla un error en pantalla con el numero de linea que se esta ejecutando mal en el codigo
                try {
     
                    $link = new PDO('mysql:host=' . $host . '; dbname=' . $dbname, $dbuser, $dbpass,
                    array(PDO::MYSQL_ATTR_INIT_COMMAND => $charset));
     
                    $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
     
                    return $link;
     
                } catch (Exception $e) {
                    
                    echo "Error en la conexión: " . $e->getLine();
     
                }
     
            }
     
        }
     
    ?>