<%-- 
    Document   : paypal
    Created on : Mar 18, 2022, 9:46:33 PM
    Author     : Aman Karanjit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Ensures optimal rendering on mobile devices -->
    </head>

    <body>
        <div id="paypal-payement-button">

        </div>
        
        <!-- Include the PayPal JavaScript SDK; replace "test" with your own sandbox Business account app client ID -->
        <script src="https://www.paypal.com/sdk/js?client-id=AaGPDbS6gpI5fF2ANVrhk3s3mNxbFhFNlhPwwiq9gidXEQ0fJog__UNAvFKtIYbSGKVYQN6GN5gnkNQP&currency=USD&disable-funding=credit,card"></script>
        
    </body>

</html>