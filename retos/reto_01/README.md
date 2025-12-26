# 🐍 Reto 1: The Bronze Ingestor Pipeline

**Diplomado Gestión de Datos 2026**

## 📝 Contexto
Tienes una carpeta `landing/` llena de archivos recibidos de diversos sensores y sistemas. Lamentablemente, la transmisión es inestable y muchos archivos llegan corruptos (vacíos).

Tu tarea es crear un script de Python que procese estos archivos, separando los datos útiles de la basura, sin detenerse por errores.

## 🎯 Instrucciones del Reto

Crea un archivo llamado `ingestor.py` en la raíz de esta carpeta que realice lo siguiente:

1.  **Escanear**: Iterar por todos los archivos en la carpeta `landing/`.
2.  **Clasificar**:
    * Si el archivo tiene contenido (**> 0 bytes**): Muévelo a la carpeta `bronze/`.
    * Si el archivo está vacío (**0 bytes**): Muévelo a la carpeta `bad_data/`.
3.  **Registrar (Logging)**:
    * El script debe imprimir en consola o generar un pequeño log indicando qué pasó con cada archivo.
    * *Ejemplo:* "Procesado: data_001.csv -> Bronze" o "Rechazado: error.log -> Bad Data".
4.  **Robustez**: Usa `try/except`. El programa **NO** debe detenerse si encuentra un error con un solo archivo.

## 🛠️ Requerimientos Técnicos
* Usar librería `pathlib` para manejar rutas.
* Usar `shutil` para mover archivos.
* Al final de la ejecución, la carpeta `landing/` debe quedar vacía.

¡Buena suerte!
