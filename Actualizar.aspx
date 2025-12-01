<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Actualizar.aspx.cs" Inherits="LibreriaWebForms.Actualizar" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Actualizar Libros</title>
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
            max-width: 550px;
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

        .message {
            margin-bottom: 20px;
            padding: 12px 16px;
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

        .selector-section {
            background: #f8f9ff;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            border-left: 4px solid #667eea;
        }

        .selector-label {
            display: block;
            color: #333;
            font-weight: 600;
            margin-bottom: 10px;
            font-size: 14px;
        }

        select {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
            background-color: white;
            color: #333;
            cursor: pointer;
            transition: border-color 0.3s ease;
            appearance: none;
            background-image: url('data:image/svg+xml;charset=UTF-8,%3csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"%3e%3cpolyline points="6 9 12 15 18 9"%3e%3c/polyline%3e%3c/svg%3e');
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 20px;
            padding-right: 35px;
        }

        select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-section {
            margin-bottom: 25px;
        }

        .form-section h3 {
            color: #333;
            font-size: 16px;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #e0e0e0;
        }

        .form-group {
            margin-bottom: 18px;
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

        .btn-primary:active {
            transform: translateY(0);
        }

        .btn-secondary {
            background: #f0f0f0;
            color: #333;
        }

        .btn-secondary:hover {
            background: #e0e0e0;
        }

        @media (max-width: 600px) {
            .container {
                padding: 25px;
            }

            .header h2 {
                font-size: 22px;
            }

            .form-actions {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2>Actualizar Libro</h2>
                <p>Selecciona y modifica los datos del libro</p>
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="message"></asp:Label>

            <div class="selector-section">
                <label class="selector-label">Selecciona un libro:</label>
                <asp:DropDownList ID="ddlLibros" runat="server" AutoPostBack="true" 
                    OnSelectedIndexChanged="ddlLibros_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="form-section">
                <h3>Información del Libro</h3>

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
            </div>

            <div class="form-actions">
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary" OnClick="btnActualizar_Click" />
                <a href="Default.aspx" class="btn btn-secondary" style="text-decoration: none; display: flex; align-items: center; justify-content: center;">Regresar</a>
            </div>
        </div>
    </form>
</body>
</html>