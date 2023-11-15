<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto.beans.AlumnoEvento" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.proyecto.beans.Alumno" %>
<jsp:useBean id="lista_participantes" scope="request" type="ArrayList<AlumnoEvento>" />
<jsp:useBean id="lista_participantes_pendientes" scope="request" type="ArrayList<AlumnoEvento>" />
<%int idEvento = Integer.parseInt((String) request.getAttribute("idE"));%>
<jsp:useBean id="usuariologueado" scope="session" type="com.example.proyecto.beans.Alumno" class="com.example.proyecto.beans.Alumno"/>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Act: Participantes</title>
    <!-- Icono de pestaña -->
    <link rel="icon" href="images/IconoBat.png" />
    <!-- Iconos -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- css -->
    <link rel="stylesheet" href="css/styleEventos.css">

</head>

<body>
<div class="menu">
    <ion-icon name="menu-outline"></ion-icon>
    <ion-icon name="close-outline"></ion-icon>
</div>

<div class="barra-lateral">
    <div>
        <div class="nombre-pagina">
            <ion-icon id="menubar" name="menu-outline"></ion-icon>
            <span>Semana Teleco</span>

        </div>

    </div>

    <nav class="navegacion">
        <ul>
            <li>
                <!-- Se coloca id para que cuando estemos en esa opción del menú este icono esté seleccionado -->
                <a href="<%=request.getContextPath() %>/DelegadoActividadServlet?action=main_page">
                    <ion-icon name="home-outline"></ion-icon>
                    <span>Inicio</span>
                </a>
            </li>

            <div class="linea"></div>

            <li>
                <a  href="<%=request.getContextPath() %>/DelegadoActividadServlet?action=mis_eventos">
                    <ion-icon name="calendar-clear-outline"></ion-icon>
                    <span>Mis eventos</span>
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath() %>/DelegadoActividadServlet?action=eventos_finalizados">
                    <ion-icon name="medal-outline"></ion-icon>
                    <span>Finalizados</span>
                </a>
            </li>

            <div class="linea"></div>

            <li>
                <a href="<%=request.getContextPath() %>/DelegadoActividadServlet?action=donaciones">
                    <ion-icon name="heart-outline"></ion-icon>
                    <span>Donaciones</span>
                </a>
            </li>

            <li>
                <a id="miActividad" href="<%=request.getContextPath() %>/DelegadoActividadServlet?action=mi_actividad">
                    <ion-icon name="clipboard-outline"></ion-icon>
                    <span>Mi actividad</span>
                </a>
            </li>

            <div class="linea"></div>

            <li>
                <a href="https://www.instagram.com/aitel.pucp/" target="_blank">
                    <ion-icon name="logo-instagram"></ion-icon>
                    <span>Instagram</span>
                </a>
            </li>
            <li>
                <a href="mailto:aitel@pucp.pe" target="_blank">
                    <ion-icon name="mail-outline"></ion-icon>
                    <span>Gmail</span>
                </a>
            </li>
            <div class="linea"></div>
            <li>
                <a href="<%=request.getContextPath()%>/SesionServlet?action=cerrar_sesion">
                    <ion-icon name="log-out-outline"></ion-icon>
                    <span>Cerrar sesión</span>
                </a>
            </li>
        </ul>
    </nav>

    <div>
        <div class="linea"></div>
        <!-- Tratar de colocar el botón de cerrar sesión aqui -->
        <div class="modo-oscuro">
            <div class="info">
                <ion-icon name="moon-outline"></ion-icon>
                <span>Dark Mode</span>
            </div>
            <div class="switch">
                <div class="base">
                    <div class="circulo">

                    </div>
                </div>
            </div>

        </div>


        <div class="usuario">
            <img src="images/usuario.jpg">
            <div class="info-usuario">
                <div class="nombre-email">
                    <span class="nombre">Usuario</span>
                    <!--<span class="email">codigo@pucp.edu.com</span>-->
                    <%if(session.getAttribute("usuariologueado")==null) {%>
                    <span class="email">codigo@pucp.edu.com</span>
                    <%}else{%>
                    <%Alumno alumnologueado = (Alumno) session.getAttribute("usuariologueado");%>
                    <span class="email"><%=alumnologueado.getNombre() + " " + alumnologueado.getApellido()%></span>
                    <%}%>
                </div>
                <!-- Colocarle función cambiar foto de perfil -->
                <ion-icon name="ellipsis-vertical-outline"></ion-icon>
            </div>
        </div>
    </div>

</div>


<main style="background-color: #c6e2e4;">
    <div class="container-fluid">
        <!-- header -->
        <div class="row header" style="background-color: #7c9da0;">
            <div class="col">
                <h1><strong><%=usuariologueado.getDelegadoActividad().getActividad().getTitulo()+": "%></strong></h1>
            </div>
        </div>

        <!-- Nuevos Participantes -->
        <div class="row participantes">
            <div class="col p-4 participantes rounded-4" style="background-color: #ffffff">
                <div class="row search">
                    <div class="col">
                        <h2>Nuevos participantes:</h2>
                    </div>

                    <div class="col">
                        <form class="search-form" id="search-container">
                            <input type="search" placeholder="Buscar participante..." id="search-input">
                            <button class="btn btn-search">
                                <ion-icon name="search-outline"></ion-icon>
                            </button>

                        </form>
                    </div>
                </div>
                <form method="post" action="<%=request.getContextPath()%>/DelegadoActividadServlet?action=asignar_rol">
                <!-- Tabla de participantes -->
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre </th>
                        <th scope="col">Correo</th>
                        <th scope="col">Rol</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%int p = 1;%>
                    <%for (AlumnoEvento aE: lista_participantes_pendientes){%>
                    <tr>
                        <th scope="row"><%=p%></th>
                        <td><%=aE.getAlumno().getNombre() + " " +aE.getAlumno().getApellido()%></td>
                        <td><%=aE.getAlumno().getCorreo()%></td>

                        <td>
                            <!-- Parámetros necesarios para el servlet-asignar rol -->
                            <input type="hidden" class="form-control" name="cantidad" value=<%=lista_participantes_pendientes.size()%>>
                            <input type="hidden" class="form-control" name="idE" value=<%=aE.getEvento().getIdEvento()%>>
                            <input type="hidden" class="form-control" name="idPendiente<%=p%>" value=<%=aE.getIdAlumnoEvento()%>>
                            <!-- Asignar roles -->
                            <input type="radio" name="rolAsignar<%=p%>" value="equipo" id="Equipo" />
                            <label for="Equipo">Equipo</label>

                            <input type="radio" name="rolAsignar<%=p%>" value = "barra" id="Barra" />
                            <label for="Barra">Barra</label>

                        </td>
                        <td>
                            <!-- Enviar Notificación -->
                            <button class="opcion btn btn-secondary">
                                <a href="mailto:nombre_apellido@pucp.edu.pe"
                                   class="text-light text-decoration-none" target="_blank">
                                    <ion-icon name="mail-outline"></ion-icon>
                                </a>
                            </button>
                        </td>
                    </tr>


                    <%p++;%>
                    <%};%>


                    </tbody>
                </table>
                <!-- Footer -->
                <div class="row footer">
                    <div class="col">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <%for(int i=0;i<=lista_participantes_pendientes.size()/5;i++){%>
                                <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/DelegadoActividadServlet?action=participantes&id_EventoParticipantes=<%=idEvento%>&offset_pendientes=<%=i*5%>"><%=i+1%></a></li>
                                <%};%>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>

                <!-- Guardar nuevos participantes revisar si es necesario poner doble si es lo mismo-->
                <div class="modal fade" id="guardarNuevos" aria-hidden="true"
                     aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="guardarNuevosLabel">Guardar cambios</h5>

                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>


                            </div>
                            <div class="modal-body">
                                ¿Estás seguro que quieres guardar los cambios?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-primary" data-bs-target="#guardarNuevos2"
                                        data-bs-toggle="modal" data-bs-dismiss="modal">Sí</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="guardarNuevos2" aria-hidden="true"
                     aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                Se guardaron los cambios exitosamente.
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row text-center">
                    <div class="col">
                        <%if (lista_participantes_pendientes.isEmpty()){%>
                        <a class="btn btn-dark disabled" data-bs-toggle="modal" href="#guardarNuevos" role="button">Guardar
                            cambios</a>
                        <%};%>
                        <%if (!lista_participantes_pendientes.isEmpty()){%>
                        <a class="btn btn-dark" data-bs-toggle="modal" href="#guardarNuevos" role="button">Guardar
                            cambios</a>
                        <%};%>
                    </div>
                </div>
                </form>


            </div>

        </div>

        <!-- Participantes  -->
        <div class="row participantes">
            <div class="col p-4 rounded-4" style="background-color: #ffffff">
                <div class="row search">
                    <div class="col">
                        <h2>Lista de participantes:</h2>
                    </div>

                    <div class="col">
                        <form class="search-form" id="search2-container">
                            <input type="search" placeholder="Buscar participante..." id="search2-input">
                            <button class="btn btn-search">
                                <ion-icon name="search-outline"></ion-icon>
                            </button>

                        </form>
                    </div>
                </div>
                <!-- Tabla de participantes -->
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre </th>
                        <th scope="col">Correo</th>
                        <th scope="col">Rol</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>

                    <%int i = 1;%>
                    <%for (AlumnoEvento aE : lista_participantes){%>
                    <tr>
                        <th scope="row"><%=i%></th>
                        <td><%=aE.getAlumno().getNombre() + " " + aE.getAlumno().getApellido()%></td>
                        <td><%=aE.getAlumno().getCorreo()%></td>
                        <td><%=aE.getIntegrante().getDescripcion()%></td>

                        <td>
                            <button class="opcion btn btn-warning" data-bs-toggle="modal" data-bs-target="#cambiarRolA<%=i%>">
                                <ion-icon name="repeat-outline"></ion-icon>
                            </button>
                        </td>
                    </tr>
                    <%i++;%>
                    <%};%>


                    </tbody>
                </table>
                <!-- Footer -->
                <div class="row footer">
                    <div class="col">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>


                <%int j = 1;%>
                <%for (AlumnoEvento aE : lista_participantes){%>
                <!-- Guardar cambios de rol -->
                <div class="modal fade" id="cambiarRolA<%=j%>" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
                     tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cambiarRolLabel">Cambio de rol</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ¿Estás seguro que quieres cambiar el rol del participante?
                            </div>
                            <form method="post" action="<%=request.getContextPath()%>/DelegadoActividadServlet?action=cambiar_rol">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Cancelar</button>
                                    <input type="hidden" class="form-control" name="idAE" value=<%=aE.getIdAlumnoEvento()%>>

                                    <button type="submit" class="btn btn-primary" data-bs-target="#cambiarRolB<%=j%>"
                                            data-bs-toggle="modal" data-bs-dismiss="modal">Sí</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="cambiarRolB<%=j%>" aria-hidden="true"
                     aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                Se guardaron los cambios exitosamente.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                                    <a href="<%=aE.getAlumno().getCorreo()%>"
                                       class="text-light text-decoration-none" target="_blank">Enviar correo</a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <%j++;%>
                <%};%>


                <!-- BORRAR SI ES REDUNDANTA O NO  -->
                <div class="row text-center">

                    <div class="col">
                        <%if (lista_participantes.isEmpty()){%>
                        <a class="btn btn-dark disabled" data-bs-toggle="modal" href="#guardarNuevos" role="button">Guardar
                            cambios</a>
                        <%};%>
                        <%if (!lista_participantes.isEmpty()){%>
                        <a class="btn btn-dark" data-bs-toggle="modal" href="#guardarNuevos" role="button">Guardar
                            cambios</a>
                        <%};%>
                    </div>
                </div>

            </div>

        </div>

    </div>

</main>



<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="js/mainscript.js"></script>
<!--Script de bootstrap  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>


</body>

</html>
