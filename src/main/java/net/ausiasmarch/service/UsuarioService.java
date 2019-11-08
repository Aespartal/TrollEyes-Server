package net.ausiasmarch.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Connection;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import net.ausiasmarch.bean.ResponseBean;
import net.ausiasmarch.bean.UsuarioBean;
import net.ausiasmarch.connection.ConnectionInterface;
import net.ausiasmarch.dao.UsuarioDao;
import net.ausiasmarch.factory.ConnectionFactory;
import net.ausiasmarch.factory.GsonFactory;
import net.ausiasmarch.setting.ConnectionSettings;

public class UsuarioService {

    HttpServletRequest oRequest = null;

    public UsuarioService(HttpServletRequest oRequest) {
        this.oRequest = oRequest;
    }

    public String login() {
        HttpSession oSession = oRequest.getSession();
        ResponseBean oResponseBean = null;
        if (oRequest.getParameter("username").equals("rafa") && oRequest.getParameter("password").equalsIgnoreCase("017FBC0E001B5E9C16908C754F9607DC886F25D08B2CBADC788B8B267DF199F2")) {
            oSession.setAttribute("usuario", oRequest.getParameter("username"));
            oResponseBean = new ResponseBean(200, "Welcome");
        } else {
            oResponseBean = new ResponseBean(500, "Wrong password");
        }
        Gson oGson = GsonFactory.getGson();
        return oGson.toJson(oResponseBean);
    }

    public String check() {
        HttpSession oSession = oRequest.getSession();
        ResponseBean oResponseBean = null;
        if (oSession.getAttribute("usuario") != null) {
            oResponseBean = new ResponseBean(200, (String) oSession.getAttribute("usuario"));
        } else {
            oResponseBean = new ResponseBean(500, "No active session");
        }
        Gson oGson = GsonFactory.getGson();
        return oGson.toJson(oResponseBean);
    }

    public String logout() {
        HttpSession oSession = oRequest.getSession();
        oSession.invalidate();
        ResponseBean oResponseBean = null;
        oResponseBean = new ResponseBean(200, "No active session");
        Gson oGson = GsonFactory.getGson();
        return oGson.toJson(oResponseBean);
    }

    //Inacabado
    public String insert() throws Exception {
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        ResponseBean oResponseBean;
        Gson oGson = GsonFactory.getGson();
        HttpSession oSession = oRequest.getSession();
        if (oSession.getAttribute("usuario") == null) {
            oResponseBean = new ResponseBean(500, "Inicie sesión para acceder a esta función");
            return oGson.toJson(oResponseBean);
        }

        oConnectionImplementation = ConnectionFactory
                .getConnection(ConnectionSettings.connectionPool);
        oConnection = oConnectionImplementation.newConnection();
        String nombre = oRequest.getParameter("nombre");
        String apellido1 = oRequest.getParameter("apellido1");
        String apellido2 = oRequest.getParameter("apellido2");
        String dni = oRequest.getParameter("dni");
        String email = oRequest.getParameter("email");
        String login = oRequest.getParameter("login");
        String password = oRequest.getParameter("password");

        UsuarioBean oUsuarioBean = new UsuarioBean(nombre, email, dni, apellido1, apellido2, login, password);
        UsuarioDao oUsuarioDao = new UsuarioDao(oConnection);
        if (oUsuarioDao.insert(oUsuarioBean) == 0) {
            oResponseBean = new ResponseBean(500, "KO");
        } else {
            oResponseBean = new ResponseBean(200, "OK");
        }
        if (oConnection != null) {
            oConnection.close();
        }
        if (oConnectionImplementation != null) {
            oConnectionImplementation.disposeConnection();
        }
        return oGson.toJson(oResponseBean);

    }

    public String fill() throws Exception {
        ConnectionInterface oConnectionImplementation = ConnectionFactory
                .getConnection(ConnectionSettings.connectionPool);
        Connection oConnection = oConnectionImplementation.newConnection();
        ResponseBean oResponseBean;
        Gson oGson = GsonFactory.getGson();

        UsuarioDao oUsuarioDao = new UsuarioDao(oConnection);
        UsuarioBean oUsuarioBean = new UsuarioBean();
        Integer number = Integer.parseInt(oRequest.getParameter("number"));
        for (int i = 0; i < number; i++) {
            String nombre = nombreRandom();
            String apellido1 = apellido2Random();
            String apellido2 = apellido2Random();
            oUsuarioBean.setDni(dniRandom());
            oUsuarioBean.setNombre(nombre);
            oUsuarioBean.setEmail(emailRandom());
            oUsuarioBean.setApellido1(apellido1);
            oUsuarioBean.setApellido2(apellido2);
            oUsuarioBean.setIdTipoUsuario(2);
            oUsuarioBean.setLogin(loginRandom(nombre, apellido1, apellido2));
            oUsuarioBean.setPassword("DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04");
            oUsuarioDao.insert(oUsuarioBean);
        }
        oResponseBean = new ResponseBean(200, "Se ha añadido correctamente.");
        if (oConnection != null) {
            oConnection.close();
        }
        if (oConnectionImplementation != null) {
            oConnectionImplementation.disposeConnection();
        }

        return oGson.toJson(oResponseBean);
    }

    private String nombreRandom() {
        String[] nombre = {"Alejandro", "Carlos", "David",
            "Ivan", "Vicente", "Lucia", "Sonia",
            "Raul", "Nacho", "Pancracio", "Mastodonte"};
        String nombreRandom = "";
        return nombreRandom = nombre[(int) (Math.random() * nombre.length) + 0];
    }

    private String apelido1Random() {
        String[] apellido1 = {"Perez", "Rodriguez", "Vidal",
            "La Piedra", "Menganito ", "Crack", "Gomez",
            "Guerrero", "Cardenas", "Cardiel"};
        String apellido1Random = "";
        return apellido1Random = apellido1[(int) (Math.random() * apellido1.length) + 0];
    }

    private String apellido2Random() {
        String[] apellido2 = {"La Piedra", "Dominguez ",
            "Broncano", "Fiera", "Castiyo",
            "Castorena", "Castro", "Grande"};
        String apellido2Random = "";
        return apellido2Random = apellido2[(int) (Math.random() * apellido2.length) + 0];
    }

    private String emailRandom() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 10) {
            int index = (int) (rnd.nextFloat() * chars.length());
            salt.append(chars.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr + "@gmail.com";
    }

    private String dniRandom() {

        String[] letra = {"T", "R", "W", "A", "G", "M", "Y", "F", "P", "D", "X", "B", "N", "J", "Z", "S", "Q", "V", "H", "L", "C", "K", "E"};

        String letraRandom = letra[(int) (Math.random() * letra.length) + 0];
        int numeroRandom = (int) (Math.random() * (10000000 - 99999999 + 1) + 99999999);

        return numeroRandom + letraRandom;
    }

    private String loginRandom(String nombre, String apellido1, String apellido2) {
        int numberRandom = (int) (Math.random() * 99 + 1);
        String username = nombre.substring(0, 1) + apellido1.substring(0, 1) + apellido2.substring(0, 1) + numberRandom;
        return username;
    }
}
