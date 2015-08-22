package br.com.caelum.agenda.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contadorServlet")
public class ContadorServlet extends HttpServlet {
	private int contador = 0; // variavel de instancia
	
	@Override
	public void init() throws ServletException {
		super.init();
		System.out.println("Criando a servlet ContadorServlet");
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		contador++;
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<body>");
		out.println("Contador agora é: " + contador);
		out.println("</body>");
		out.println("</html>");
		
		
	}
	
	@Override
	public void destroy() {
		super.destroy();
		System.out.println("Destruindo a servlet ContadorServlet");
	}
}
