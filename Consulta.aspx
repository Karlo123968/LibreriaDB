<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="LibreriaWebForms.Consulta" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Consulta de Libros</title>
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
            max-width: 1000px;
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

        .search-section {
            background: #f8f9ff;
            padding: 25px;
            border-radius: 8px;
            margin-bottom: 30px;
            border-left: 4px solid #667eea;
        }

        .search-label {
            display: block;
            color: #333;
            font-weight: 600;
            margin-bottom: 12px;
            font-size: 14px;
        }

        .search-box {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .search-box input[type="text"] {
            flex: 1;
            min-width: 250px;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .search-box input[type="text"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .btn {
            padding: 12px 28px;
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

        .results-section {
            margin-bottom: 30px;
        }

        .results-title {
            color: #333;
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #e0e0e0;
        }

        .table-wrapper {
            overflow-x: auto;
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

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #999;
        }

        .empty-state-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .empty-state p {
            font-size: 16px;
        }

        .footer {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid #e0e0e0;
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

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            .header h2 {
                font-size: 22px;
            }

            .search-box {
                flex-direction: column;
            }

            .search-box input[type="text"] {
                min-width: auto;
            }

            .btn {
                width: 100%;
            }

            table {
                font-size: 12px;
            }

            table th,
            table td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2>Buscar Libros</h2>
                <p>Encuentra libros en nuestro catálogo</p>
            </div>

            <div class="search-section">
                <label class="search-label">Buscar por título o autor:</label>
                <div class="search-box">
                    <asp:TextBox ID="txtBuscar" runat="server" placeholder="Ingresa un título o nombre de autor..."></asp:TextBox>
                    <asp:Button Text="Buscar" ID="btnBuscar" runat="server" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
                </div>
            </div>

            <div class="results-section">
                <div class="results-title">Resultados de la Búsqueda</div>
                <div class="table-wrapper">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table"></asp:GridView>
                </div>
            </div>

            <div class="footer">
                <a href="Default.aspx" class="btn-regresar">← Regresar al Menú</a>
            </div>
        </div>
    </form>
</body>
</html>