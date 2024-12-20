<%-- 
    Document   : payshop
    Created on : 26 ago 2024, 20:34:35
    Author     : Joaquin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>El y Ella Detalles - Pago</title>
        <link rel="stylesheet" href="../style.css">
        <link rel="icon" href="../img/el y ella logo.jpeg">
    </head>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            height: 100vh;
            background: url('../img/banner_log.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .body-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 105, 180, 0.5);
            z-index: -1;
        }

        .contenedor-pago {
            background-color: #ff85c1;
            border-radius: 1.2rem;
            padding: 1.5rem;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            color: #333;
        }

        .contenedor-pago h2 {
            color: #fff;
            font-size: 2rem;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .grupo-input {
            margin-bottom: 1rem;
            display: flex;
            flex-direction: column;
            gap: 0.3rem;
        }

        .grupo-input label {
            color: #fff;
            font-size: 1rem;
        }

        .grupo-input input, .grupo-input select {
            padding: 0.7rem 1rem;
            border-radius: 0.5rem;
            border: none;
            font-size: 1rem;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .grupo-doble {
            display: flex;
            gap: 0.7rem;
        }

        .grupo-doble .grupo-input {
            flex: 1;
        }

        .btn-pago {
            background-color: #e21184;
            color: #fff;
            padding: 0.8rem;
            font-size: 1.3rem;
            border: none;
            border-radius: 0.7rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center;
            display: block;
            width: 100%;
            margin-top: 0.8rem;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .btn-pago:hover {
            background-color: #d04493;
        }

        .contenedor-pago form {
            display: flex;
            flex-direction: column;
            gap: 0.7rem;
        }

        @media (max-width: 600px) {
            .grupo-doble {
                flex-direction: column;
            }
        }
    </style>
    <body>
        <div class="body-overlay"></div>
        <div class="contenedor-pago">
            <h2>Formulario de Pago</h2>
            <form id="form-pago" action="${pageContext.request.contextPath}/ControlPago" method="post">

                <div class="grupo-input">
                    <label for="nombre">Nombre Completo</label>
                    <input type="text" id="nombre" name="nombre" placeholder="Ingresa tu nombre completo" required>
                </div>
                <div class="grupo-input">
                    <label for="correo">Correo Electrónico</label>
                    <input type="email" id="correo" name="correo" placeholder="Ingresa tu correo" required>
                </div>
                <div class="grupo-input">
                    <label for="telefono">Teléfono</label>
                    <input type="tel" id="telefono" name="telefono" placeholder="Ingresa tu número de teléfono" required>
                </div>
                <div class="grupo-input">
                    <label for="direccion">Dirección de Envío</label>
                    <input type="text" id="direccion" name="direccion" placeholder="Ingresa tu dirección" required>
                </div>
                <div class="grupo-doble">
                    <div class="grupo-input">
                        <label for="ciudad">Ciudad</label>
                        <input type="text" id="ciudad" name="ciudad" placeholder="Ingresa tu ciudad" required>
                    </div>
                    <div class="grupo-input">
                        <label for="estado">Estado</label>
                        <input type="text" id="estado" name="estado" placeholder="Ingresa tu estado" required>
                    </div>
                </div>
                <div class="grupo-input">
                    <label for="codigo-postal">Código Postal</label>
                    <input type="text" id="codigo-postal" name="codigo-postal" placeholder="Ingresa tu código postal" required>
                </div>
                <div class="grupo-input">
                    <label for="tarjeta">Número de Tarjeta</label>
                    <input type="text" id="tarjeta" name="tarjeta" placeholder="Ingresa el número de tu tarjeta" required>
                </div>
                <div class="grupo-doble">
                    <div class="grupo-input">
                        <label for="fecha-expiracion">Fecha de Expiración</label>
                        <input type="text" id="fecha-expiracion" name="fecha-expiracion" placeholder="MM/AA" required>
                    </div>
                    <div class="grupo-input">
                        <label for="cvv">CVV</label>
                        <input type="text" id="cvv" name="cvv" placeholder="Ingresa el CVV" required>
                    </div>
                </div>
                <button type="submit" class="btn-pago">Realizar Pago</button>
            </form>
        </div>
        <script src="https://kit.fontawesome.com/74353e97ea.js" crossorigin="anonymous"></script>
        <!-- SweetAlert2 JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            const form = document.getElementById('form-pago');
            form.addEventListener('submit', function (event) {
                const inputs = form.querySelectorAll('input[required]');
                let allFilled = true;

                inputs.forEach(input => {
                    if (!input.value) {
                        allFilled = false;
                    }
                });

                if (!allFilled) {
                    event.preventDefault(); // Prevenir el envío si hay campos vacíos
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Por favor completa todos los campos requeridos.',
                    });
                }
            });
        </script>
    </body>

</html>


