<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.proyecto.beans.Alumno" %>
<%@ page import="com.example.proyecto.beans.DelegadoGeneral" %>
<%@ page import="com.example.proyecto.beans.Donacion" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="lista2" scope="request" type="ArrayList<com.example.proyecto.beans.Donacion>" />
<jsp:useBean id="textoBusqueda" scope="request" type="java.lang.String" class="java.lang.String"/>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
  <title>Comprobar Donaciones</title>
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/IconoBat.png">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="assets/css/feathericon.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
<div class="main-wrapper">
  <!-- CABECERA -->
  <div class="header">
    <!-- CABECERA DE LA BARRA LATERAL LISTOOOOO -->
    <div class="header-left">
      <a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=main_page" class="logo text-decoration-none"> <img
              src="assets/img/IconoBat.png" width="30" height="50" alt="logo"> <span
              class="logoclass">TELEWEEK</span> </a>
    </div>
    <!-- LAS RAYITAS Q ABREN A LA BARRA LISTOOO-->
    <a class="text-decoration-none" href="javascript:void(0);" id="toggle_btn"> <i class="fe fe-text-align-left"></i> </a>
    <a class="mobile_btn text-decoration-none" id="mobile_btn"> <i class="fas fa-bars"></i> </a>
    <!-- NAVBAR -->
    <ul class="nav user-menu">
      <!-- FOTO DE PERFIL CON LAS OPCIONES DE EDITAR PERFIL Y DEMAS -->
      <li class="nav-item dropdown has-arrow">
        <a href="#" class="dropdown-toggle nav-link text-decoration-none" data-bs-toggle="dropdown"> <span class="user-img"><img
                class="rounded-circle" src="assets/img/profiles/usuario.jpg" width="50"></span>
        </a>
        <!-- MENU DESPLEGABLE DE LA FLECHITA DE LA FOTO DE PERFIL -->
        <div class="dropdown-menu">
          <div class="user-header">
            <!-- nombre y rol del usuario -->
            <div class="user-text">
              <%if (session.getAttribute("usuariologueado") == null) {%>
              <span class="email">codigo@pucp.edu.com</span>
              <%} else {%>
              <%DelegadoGeneral delegadoGenerallogueado = (DelegadoGeneral) session.getAttribute("usuariologueado");%>
              <h6><%=delegadoGenerallogueado.getNombre() + " " + delegadoGenerallogueado.getApellido()%>
              </h6>
              <%}%>
              <p class="text-muted mb-0">Delegado General</p>
            </div>
          </div>
          <a class="dropdown-item text-decoration-none" href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=perfil">Mi
            Perfil</a>
          <a class="dropdown-item text-decoration-none"
             href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=cerrar_sesion">Cerrar
            Sesión</a>
        </div>
      </li>
    </ul>
  </div>
  <!-- FIN CABECERA -->

  <!-- BARRA LATERAL -->
  <div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
      <div id="sidebar-menu" class="sidebar-menu">
        <ul>
          <li><a class="text-decoration-none" href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=main_page"><i
                  class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a>
          </li>
          <li class="list-divider"></li>

          <li class="menu-title mt-3"><span>ACCIONES</span></li>
          <!-- USUARIOS -->
          <li class="submenu"><a class="text-decoration-none" href="#"><i class="fas fa-user"></i> <span> Usuarios </span> <span
                  class="menu-arrow"></span></a>
            <ul class="submenu_class" style="display: none;">
              <li><a class="text-decoration-none"
                     href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=validar_registro">
                Solicitudes </a></li>
              <li><a class="text-decoration-none" href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=lista_usuarios">
                Registrados </a></li>
            </ul>
          </li>

          <!-- DONACIONES -->
          <li class="submenu"><a class="text-decoration-none" href="#"><i class="bi bi-heart-fill"></i> <span> Donaciones </span>
            <span class="menu-arrow"></span></a>
            <ul class="submenu_class" style="display: none;">
              <li>
                <a class="active text-decoration-none" href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=validar_donaciones">Por verificar</a>
              </li>
              <li><a class="text-decoration-none" href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=lista_donaciones">Verificadas</a>
              </li>
            </ul>
          </li>

          <!-- ACTIVIDADES -->
          <li><a class="text-decoration-none" href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=editar_actividades"><i
                  class="bi bi-calendar-fill"></i><span>Actividades</span></a>
          </li>

          <!-- CONTACTOS -->
          <li class="list-divider"></li>
          <li class="menu-title mt-3"><span>CONTACTOS</span></li>
          <li><a class="text-decoration-none" href="https://www.instagram.com/aitel.pucp/" target="_blank">
            <i class="bi bi-instagram"></i> <span>Instagram</span></a></li>
          <li><a class="text-decoration-none" href="mailto:aitel@pucp.pe" target="_blank"><i class="fas fa-envelope"></i>
            <span>Gmail</span></a></li>

        </ul>
      </div>
    </div>
  </div>
  <!-- FIN BARRA LATERAL -->
  <!-- TODO LO Q ESTA EN LA PAGINA SIN BARRA LATERAL -->
  <div class="page-wrapper">
    <div class="content container-fluid">
      <div class="page-header">
        <div class="row align-items-center">
          <div class="col">
            <div class="mt-5">
              <h4 class="card-title float-left mt-2">Comprobar Donaciones</h4>
            </div>
          </div>
        </div>
      </div>
      <!-- MENSAJES DE ERROR O CONFIRMACION -->
      <% if (request.getParameter("msg") != null) {%>
      <div class="alert alert-success" role="alert"><%=request.getParameter("msg")%>
      </div>
      <% } %>
      <% if (request.getParameter("err") != null) {%>
      <div class="alert alert-danger" role="alert"><%=request.getParameter("err")%>
      </div>
      <% } %>
      <!-- BUSCAR DONACION IMPLEMENTAR EN EL SERVLET Y DAO -->
      <form method="post" action="<%=request.getContextPath()%>/DelegadoGeneralServlet?action=buscar">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Buscar por nombre" name="textoBuscar"
                 value="<%=textoBusqueda%>"/>
          <button class="input-group-text" type="submit">
            <i class="bi bi-search"></i>
          </button>
          <a class="input-group-text" href="<%=request.getContextPath()%>/DelegadoGeneralServlet?action=validar_donaciones">
            <i class="bi bi-x-circle"></i>
          </a>
        </div>
      </form>
      <!-- LISTA DE NUEVAS DONACIONES -->
      <div class="row">
        <div class="col-sm-12">
          <div class="card">
            <div class="card-body">
              <div class="table-responsive">
                <!-- TABLA DE NUEVAS DONACIONES -->
                <table class="table table-hover mt-1 mb-1">
                  <thead>
                  <tr>
                    <th>#</th>
                    <th>Usuario</th>
                    <th>Correo</th>
                    <th>Fecha</th>
                    <th>Medio de pago</th>
                    <th>Comprobante</th>
                  </tr>
                  </thead>

                  <tbody>
                  <%-- FALTA IMPLEMENTAR DAO--%>

                  <tr>
                    <th>1</th>
                    <td>Nombre Apellido</td>
                    <td>nombre@pucp.edu.pe</td>
                    <td>dd/mm/aaaa</td>
                    <td>
                      <img src="images/yape_logo.jpg" alt="Pago" width="32px"
                           style="border-radius: 25%;">
                    </td>
                    <!-- OBSERVAR COMPROBANTE-->
                    <td>
                      <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalMostrar">
                        <i class="bi bi-eye"></i>
                      </button>
                    </td>
                    <!-- MODAL OBSERVAR COMPROBANTE-->
                    <div class="modal fade" id="modalMostrar" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <form>
                            <div class="modal-header">
                              <h5 class="fw-bold">Verifique la donación realizada</h5>
                              <button type="button" class="btn-close"
                                      data-bs-dismiss="modal"
                                      aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <div class="mb-3 d-flex justify-content-center align-items-center flex-column">
                                <img src="images/comprobante.png" alt="comprobante de pago"
                                     class="img-thumbnail w-70">
                              </div>

                              <div class="mb-3">
                                <h6 class="fw-bold">Monto ingresado:</h6>
                                <!-- IMPLEMENTAR EL DAO -->
                                <p class="form-control">S/. 100
                                </p>
                              </div>

                            </div>
                            <div class="modal-footer">
                              <!-- BOTÓN PARA EL MODAL VALIDO -->
                              <button type="button" class="btn btn-primary"
                                      data-bs-toggle="modal"
                                      data-bs-target="#valido">
                                Validar donación
                              </button>
                              <!-- BOTÓN PARA EL MODAL NO VALIDO-->
                              <button type="button" class="btn btn-danger"
                                      data-bs-toggle="modal"
                                      data-bs-target="#noValido">
                                No validar donación
                              </button>
                            </div>

                          </form>
                        </div>
                      </div>
                    </div>
                    <!-- FIN MODAL OBSERVAR COMPROBANTE-->
                    <!-- MODAL CONFIRMACION DE VALIDAR-->
                    <div class="modal fade" id="valido" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title">Donación validada
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body text-justify">
                            Has seleccionado "validar donación". <br>
                            Si esta es la acción que deseas realizar, por favor confirma tu elección,
                            de lo contrario, selecciona cancelar.
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-light active"
                                    data-bs-dismiss="modal">Cancelar
                            </button>
                            <button type="button" class="btn btn-primary">Validar donación
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- FIN MODAL CONFIRMACION DE VALIDAR-->

                    <!-- MODAL CONFIRMACION DE NO VALIDAR-->
                    <div class="modal fade" id="noValido" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title">Donación no validada
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body text-justify">
                            Has seleccionado "no validar donación". <br>
                            Si esta es la acción que deseas realizar, por favor confirma tu elección,
                            de lo contrario, selecciona cancelar.
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-light active"
                                    data-bs-dismiss="modal">Cancelar
                            </button>
                            <button type="button" class="btn btn-danger">No validar donación
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- FIN MODAL CONFIRMACION DE NO VALIDAR-->
                  </tr>
                  </tbody>
                </table>
                <!-- FIN LISTA DE NUEVAS DONACIONES -->

                <!-- PAGINACION -->
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
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script src="assets/js/jquery-3.5.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/js/script.js"></script>
<!--Script de bootstrap  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

</body>

</html>