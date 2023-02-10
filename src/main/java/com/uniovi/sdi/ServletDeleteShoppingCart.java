package com.uniovi.sdi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "ServletDeleteShoppingCart", value = "/DeleteFromShoppingCart")
public class ServletDeleteShoppingCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap<String, Integer> cart = (HashMap<String, Integer>) request.getSession().getAttribute("cart");
        // No hay carrito, creamos uno y lo insertamos en sesión
        if (cart == null) {
            cart = new HashMap<String, Integer>();
            request.getSession().setAttribute("cart", cart);
        }
        String product = request.getParameter("product");
        if (product != null) {
            addToShoppingCart(cart, product);
        }
        request.setAttribute("selectedItems", cart);
        getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void addToShoppingCart(HashMap<String, Integer> cart, String product) {
        if (cart.get(product) == null) {
            return;
        }
        int productCount = (Integer) cart.get(product).intValue();
        if (productCount == 1) {
            cart.remove(product);
        } else {
            cart.put(product, Integer.valueOf(productCount - 1));
        }
    }
}
