import '../core/app_config.dart';

final appConfig = AppConfig();

/// Login
final String mainLoginLabel =
    appConfig.getString('mainLoginLabel', 'Bienvenido');
final String withoutAccountLabel =
    appConfig.getString('withoutAccountLabel', '¿Aún no tienes una cuenta?');
final String userLoginLabel = appConfig.getString('userLoginLabel', 'Username');
final String passwordLoginLabel =
    appConfig.getString('passwordLoginLabel', 'Password');
final String buttonLoginLabel =
    appConfig.getString('buttonLoginLabel', 'Login');

/// Register
final String mainRegisterLabel =
    appConfig.getString('mainRegisterLabel', 'Registrate');
final String emailRegisterLabel =
    appConfig.getString('emailRegisterLabel', 'Email');
final String nicknameRegisterLabel =
    appConfig.getString('nicknameRegisterLabel', 'Nombre de usuario');
final String passwordRegisterLabel =
    appConfig.getString('passwordRegisterLabel', 'Password');
final String userRegisterLabel =
    appConfig.getString('userRegisterLabel', 'Nombres');
final String lastnameRegisterLabel =
    appConfig.getString('lastnameRegisterLabel', 'Apellidos');
final String cellphoneRegisterLabel =
    appConfig.getString('cellphoneRegisterLabel', 'Telefono');
final String buttonRegisterLabel =
    appConfig.getString('buttonRegisterLabel', 'Registrarse');

/// Home
final String greetingsLabel = appConfig.getString('greetingsLabel', 'Hola, ');
final String orderYourProductLabel =
    appConfig.getString('orderYourProductLabel', 'Ordena tu producto favorito');
final String popularSectionLabel =
    appConfig.getString('popularSectionLabel', 'Popular');
final String seeMoreSectionLabel =
    appConfig.getString('seeMoreSectionLabel', 'Ver más');

/// Menu
final String menuLabel = appConfig.getString('menuLabel', 'Menu');
final String homeLabel = appConfig.getString('homeLabel', 'Home');
final String productLabel = appConfig.getString('productLabel', 'Productos');
final String supportLabel = appConfig.getString('supportLabel', 'Soporte');
final String contactLabel = appConfig.getString('contactLabel', 'Contacto');

/// Cart
final String mainCartLabel =
    appConfig.getString('mainCartLabel', 'Carrito de compras');
final String payLabel = appConfig.getString('payLabel', 'Pagar');
final String totalLabel = appConfig.getString('totalLabel', 'Total');
final String amountLabel = appConfig.getString('amountLabel', 'Cantidad');

/// Contact
final String mainContactLabel =
    appConfig.getString('mainContactLabel', 'Contáctanos');
final String descriptionContactLabel = appConfig.getString(
    'descriptionContactLabel',
    'Si tienes sugerencias, contáctate con nosotros.\n\nEstamos felices de ayudarte!!');
final String phoneContactLabel =
    appConfig.getString('phoneContactLabel', '+ 31 20 123 4501');
final String emailContactLabel =
    appConfig.getString('emailContactLabel', 'contactos@creative.com');

/// Support
final String mainSupportLabel =
    appConfig.getString('mainSupportLabel', 'Ayuda y Soporte');
final String descriptionSupportLabel = appConfig.getString(
    'descriptionSupportLabel',
    'Bienvenido a nuestro espacio de Ayuda y Soporte.');
final String secondarySupportLabel = appConfig.getString(
    'secondarySupportLabel', 'Nuestros horarios de servicio');
final String questionSupportLabel = appConfig.getString(
    'questionSupportLabel', '¿No encontraste la respuesta a tu pregunta?');
final String emailDescriptionSupportLabel =
    appConfig.getString('emailDescriptionSupportLabel', 'Envíanos un correo');
final String phoneDescriptionSupportLabel =
    appConfig.getString('phoneDescriptionSupportLabel', 'Llámanos');
final String messageDescriptionSupportLabel = appConfig.getString(
    'messageDescriptionSupportLabel', 'Envíanos un mensaje');
