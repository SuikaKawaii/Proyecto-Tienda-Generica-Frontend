<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="AppFrontend.src.main.java.servlet.modelo.DTO.Clientes"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Aplicación principal de administrador.">
    <title>App tienda WWW</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://use.fontawesome.com">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
    <link rel="shortcut icon" href="./images/shop-icon.png" type="image/x-icon">
    <link rel="stylesheet" href="./css/background.css" media="(min-width: 500px)">
    <link rel="stylesheet" href="./css/admin-style.css" >
    <link rel="stylesheet" href="./css/general.css">
    <link rel="stylesheet" href="./css/admin-tablet.css" media="(min-width: 500px)">
    <link rel="stylesheet" href="./css/admin-desktop.css" media="(min-width: 750px)">
</head>
<body>
    <div class="background" style="display: none;">
        <div class="circle circle-1"></div>
        <div class="circle circle-2"></div>
        <div class="circle circle-3"></div>
        <div class="circle circle-4"></div>
        <div class="circle circle-5"></div>
    </div>

    <nav class="navbar">
        <div>
            <a class="btn-admin" id="btn-home" href="ControladorUsuarios?menuUsuarios=menuUsuarios">
                <span class="btn-span">Inicio</span>
                <div class="logo">
                </div>
            </a>
        </div>
        <div class="navbar-btn">
            <a class="btn-admin white" id="btn-customers" href="ControladorUsuarios?menuUsuarios=clientesUsuarios&accion=Listar">
                <span class="btn-span">Clientes</span>
                <img src="./images/customer.svg" alt="customer">
            </a>
            <a class="btn-admin" id="btn-sales" href="ControladorUsuarios?menuUsuarios=ventasUsuarios&accion=Listar">
                <span class="btn-span">Ventas</span>
                <img src="./images/sale.svg" alt="sales">
            </a>
        </div>
        <div>
            <div class="menu__container-profile container-icon">
                <i class="fas fa-user-circle"></i>
                <div class="profile">
                    <h3>${usuario.getNombreUsuario()}</h3>
                    <div class="sign-out">
                        <a href="./login.jsp">Cerrar sesión</a>
                        <i class="fas fa-sign-out-alt"></i>
                    </div>
                </div>
            </div>
            <div class="menu__container-settings container-icon">
                <i class="fas fa-cog settings-icon"></i>
                <div class="settings">
                    <h3>Configuración</h3>
                    <div class="container-theme">
                        <span>Tema</span>
                        <div class="theme-switch" id="theme-switch" title="switch theme">
                            <div class="switch"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <main>
        <!-- <section id="message-section" class="message-section">
            <div class="message neutral-message">
                <p>
                    Selecciona una de las opciones del menu para empezar
                </p>
                <i class="fas fa-times close-message"></i>
            </div>
        </section> -->
        <form id="form-people" class="form-people" action="ControladorUsuarios" method="get">
            <input type="hidden" name="menuUsuarios" value="Clientes">
            <h2 id="title-section" class="title-section">Clientes</h2>
            <div class="input-group-section" id="input-group-section">
                <label class="input-container-admin input-container-general">
                    <input class="input-general" id="input-data-1" type="number" title="Cédula" name="txtcedula" value="${clienteSeleccionado.getCedulaCliente()}" autocomplete="off">
                    <span class="input-span-general" id="span-data-1">Cédula</span>
                </label>
                <label class="input-container-admin input-container-general">
                    <input class="input-general" id="input-data-2" type="text" title="Nombre Completo" name="txtnombre" value="${clienteSeleccionado.getNombreCliente()}" autocomplete="off">
                    <span class="input-span-general" id="span-data-2">Nombre Completo</span>
                </label>
                <label class="input-container-admin input-container-general">
                    <input class="input-general" id="input-data-3" type="text" title="Dirección" name="txtdireccion" value="${clienteSeleccionado.getDireccionCliente()}" autocomplete="off">
                    <span class="input-span-general" id="span-data-3">Dirección</span>
                </label>
                <label class="input-container-admin input-container-general">
                    <input class="input-general" id="input-data-4" type="text" title="Teléfono" name="txttelefono" value="${clienteSeleccionado.getTelefonoCliente()}" autocomplete="off">
                    <span class="input-span-general" id="span-data-4">Teléfono</span>
                </label>
                <label class="input-container-admin input-container-general">
                    <input class="input-general" id="input-data-5" type="text" title="Correo Electronico" name="txtemail" value="${clienteSeleccionado.getEmailCliente()}" autocomplete="off">
                    <span class="input-span-general" id="span-data-5">Correo Electronico</span>
                </label>
                <label class="input-container-admin input-container-general">
                    <input class="input-general" id="input-data-5" type="text" title="Ciudad" name="idCiudad" value="${clienteSeleccionado.getCiudad()}" autocomplete="off">
                    <span class="input-span-general" id="span-data-5">Ciudad</span>
                </label>
            </div>
            <div id="crud-section" class="crud-section">
                <button class="btn-admin-crud" type="submit" title="Agregar" name="accion" value="Agregar"><img src="./images/plus.svg" alt=""></button>
                <button class="btn-admin-crud" type="submit" title="Actualizar" name="accion" value="Actualizar"><img src="./images/update.svg" alt=""></button>
                <button class="btn-admin-crud" type="submit" title="Consular" name="accion" value="Consultar"><img src="./images/search.svg" alt=""></button>
                <button class="btn-admin-crud" type="submit" title="Eliminar" name="accion" value="Eliminar"><img src="./images/delete.svg" alt=""></button>
            </div>
        </form>
    </main>
    <script src="./js/app.js"></script>
</body>
</html>
