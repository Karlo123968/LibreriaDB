<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baja.aspx.cs" Inherits="LibreriaWebForms.Baja" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Baja de Libros</title>
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
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            padding: 40px;
        }

        .header {
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

        .table-wrapper {
            overflow-x: auto;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        table thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        table th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        table td {
            padding: 15px;
            border-bottom: 1px solid #e0e0e0;
            font-size: 14px;
            color: #333;
        }

        table tbody tr {
            transition: background-color 0.2s ease;
        }

        table tbody tr:hover {
            background-color: #f8f9ff;
        }

        table tbody tr:last-child td {
            border-bottom: none;
        }

        .btn-eliminar {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-eliminar:hover {
            background-color: #c82333;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(220, 53, 69, 0.3);
        }

        .btn-eliminar:active {
            transform: translateY(0);
        }

        .footer {
            text-align: center;
        }

        .btn-regresar {
            display: inline-block;
            background: #f0f0f0;
            color: #333;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-regresar:hover {
            background: #e0e0e0;
            transform: translateY(-2px);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #999;
        }

        .empty-state p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            .header h2 {
                font-size: 22px;
            }

            table {
                font-size: 12px;
            }

            table th,
            table td {
                padding: 10px;
            }

            .btn-eliminar {
                padding: 6px 12px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2>Eliminar Libros</h2>
                <p>Selecciona un libro para eliminarlo del catálogo</p>
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="message"></asp:Label>

            <div class="table-wrapper">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    OnRowCommand="GridView1_RowCommand" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" />
                        <asp:BoundField DataField="titulo" HeaderText="Título" />
                        <asp:BoundField DataField="autor" HeaderText="Autor" />
                        <asp:ButtonField Text="Eliminar" CommandName="Eliminar" ButtonType="Button" 
                            ControlStyle-CssClass="btn-eliminar" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="footer">
                <a href="Default.aspx" class="btn-regresar">← Regresar al Menú</a>
            </div>
        </div>
    </form>
</body>
</html>