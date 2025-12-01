<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Libreriaa._Default" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Librería - CRUD</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #f5f5f5;
        }
        .card-menu {
            transition: transform .2s ease, box-shadow .2s ease;
            cursor: pointer;
        }
        .card-menu:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="container py-5">
            <div class="text-center mb-4">
                <h1 class="fw-bold">📚 Librería - CRUD WebForms</h1>
                <p class="text-muted">Selecciona una opción para continuar</p>
            </div>

            <div class="row justify-content-center g-4">
                <!-- Alta -->
                <div class="col-md-3">
                    <a href="Alta.aspx" class="text-decoration-none">
                        <div class="card card-menu p-3 text-center">
                            <h4 class="fw-bold">➕ Alta</h4>
                            <p>Agregar un libro nuevo</p>
                        </div>
                    </a>
                </div>

                <!-- Baja -->
                <div class="col-md-3">
                    <a href="Baja.aspx" class="text-decoration-none">
                        <div class="card card-menu p-3 text-center">
                            <h4 class="fw-bold">🗑 Baja</h4>
                            <p>Eliminar un libro</p>
                        </div>
                    </a>
                </div>

                <!-- Actualizar -->
                <div class="col-md-3">
                    <a href="Actualizar.aspx" class="text-decoration-none">
                        <div class="card card-menu p-3 text-center">
                            <h4 class="fw-bold">✏ Actualizar</h4>
                            <p>Modificar los datos de un libro</p>
                        </div>
                    </a>
                </div>

                <!-- Consulta -->
                <div class="col-md-3">
                    <a href="Consulta.aspx" class="text-decoration-none">
                        <div class="card card-menu p-3 text-center">
                            <h4 class="fw-bold">🔍 Consulta</h4>
                            <p>Ver todos los libros</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </form>
</body>
</html>
