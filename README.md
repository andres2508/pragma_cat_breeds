# Prueba Técnica Pragma: Flutter

La prueba técnica consiste en crear una aplicación móvil en Flutter, con el objetivo de listar razas de gatos y el
detalle de cada raza.

## Versiones de Código:

* Flutter 3.19.1 • channel beta
* Dart 3.3.0
* IDE: IntellijIDEA

## Getting Started:

Para compilar el proyecto es necesario tener activo un emulador que reconozca la librería de flutter. Después de tener
activo el emulador simplemente se ejecuta la siguiente línea de comandos:

```
flutter run
```

## Internationalization build

Para generar los archivos de internacionalizacion, ejecutar este codigo.

```
flutter gen-l10n
```

## Json serialize build

Para crear las clases que transforman los modelos a objetos json, se debe ejecutar el siguiente codigo

```
flutter pub run build_runner build --delete-conflicting-outputs 
```

## Splash screen compile

Para compilar el splash screen se debe ejecutar el siguiente codigo, hay que tener en cuenta que apunta al
archivo de configuracion previamente definido.

```
dart run flutter_native_splash:create --path=flutter_native_splash.yaml
```