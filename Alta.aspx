<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alta.aspx.cs" Inherits="LibreriaWebForms.Alta" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Alta de Libros</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 100%;
            max-width: 500px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h2 {
            color: #333;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .header p {
            color: #666;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: #333;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .form-group input[type="text"],
        .form-group input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .form-group input[type="text"]:focus,
        .form-group input[type="number"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-actions {
            display: flex;
            gap: 10px;
            margin-top: 30px;
        }

        .btn {
            flex: 1;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: #f0f0f0;
            color: #333;
        }

        .btn-secondary:hover {
            background: #e0e0e0;
        }

        .message {
            margin-bottom: 20px;
            padding: 12px;
            border-radius: 6px;
            text-align: center;
            font-size: 14px;
            font-weight: 500;
            display: none;
        }

        .message.success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            display: block;
        }

        .message.error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2>Agregar Nuevo Libro</h2>
                <p>Completa los datos del libro</p>
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="message"></asp:Label>

            <div class="form-group">
                <label for="txtTitulo">Título:</label>
                <asp:TextBox ID="txtTitulo" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtAutor">Autor:</label>
                <asp:TextBox ID="txtAutor" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtEditorial">Editorial:</label>
                <asp:TextBox ID="txtEditorial" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtAnio">Año:</label>
                <asp:TextBox ID="txtAnio" runat="server" TextMode="Number" />
            </div>

            <div class="form-group">
                <label for="txtGenero">Género:</label>
                <asp:TextBox ID="txtGenero" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtPrecio">Precio:</label>
                <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number" />
            </div>

            <div class="form-group">
                <label for="txtExistencias">Existencias:</label>
                <asp:TextBox ID="txtExistencias" runat="server" TextMode="Number" />
            </div>

            <div class="form-actions">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar Libro" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
                <a href="Default.aspx" class="btn btn-secondary" style="text-decoration: none; display: flex; align-items: center; justify-content: center;">Regresar</a>
            </div>
        </div>
    </form>
</body>
</html>