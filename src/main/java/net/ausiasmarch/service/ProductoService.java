package net.ausiasmarch.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import net.ausiasmarch.bean.ProductoBean;
import net.ausiasmarch.bean.ResponseBean;
import net.ausiasmarch.connection.ConnectionInterface;
import net.ausiasmarch.dao.ProductoDao;
import net.ausiasmarch.factory.ConnectionFactory;
import net.ausiasmarch.factory.GsonFactory;
import net.ausiasmarch.setting.ConnectionSettings;

public class ProductoService implements ServiceInterface {

    HttpServletRequest oRequest = null;

    public ProductoService(HttpServletRequest oRequest) {
        this.oRequest = oRequest;
    }

    @Override
    public String get() throws Exception {
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            int id = Integer.parseInt(oRequest.getParameter("id"));
            ProductoDao oProductoDao = new ProductoDao(oConnection);
            ProductoBean oPostBean = oProductoDao.get(id);
            Gson oGson = GsonFactory.getGson();
            String strJson = oGson.toJson(oPostBean);
            return "{\"status\":200,\"message\":" + strJson + "}";
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " get method ";
            throw new Exception(msg, ex);
        } finally {
            if (oConnection != null) {
                oConnection.close();
            }
            if (oConnectionImplementation != null) {
                oConnectionImplementation.disposeConnection();
            }
        }
    }

    @Override
    public String getPage() throws Exception {
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            int iRpp = Integer.parseInt(oRequest.getParameter("rpp"));
            int iPage = Integer.parseInt(oRequest.getParameter("page"));
            List<String> orden = null;
            if (oRequest.getParameter("order") != null) {
                orden = Arrays.asList(oRequest.getParameter("order").split("\\s*,\\s*"));
            }
            ProductoDao oProductoDao = new ProductoDao(oConnection);
            ArrayList alProductoBean = oProductoDao.getPage(iPage, iRpp, orden);
            Gson oGson = GsonFactory.getGson();
            String strJson = oGson.toJson(alProductoBean);
            return "{\"status\":200,\"message\":" + strJson + "}";
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " get method ";
            throw new Exception(msg, ex);
        } finally {
            if (oConnection != null) {
                oConnection.close();
            }
            if (oConnectionImplementation != null) {
                oConnectionImplementation.disposeConnection();
            }
        }
    }

    @Override
    public String getCount() throws Exception {
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            ResponseBean oResponseBean;
            Gson oGson = GsonFactory.getGson();
            ProductoDao oProductoDao = new ProductoDao(oConnection);
            Integer iCount = oProductoDao.getCount();
            if (iCount < 0) {
                oResponseBean = new ResponseBean(500, iCount.toString());
            } else {
                oResponseBean = new ResponseBean(200, iCount.toString());
            }
            return oGson.toJson(oResponseBean);
        } catch (Exception ex) {
            String msg = this.getClass().getName() + " get method ";
            throw new Exception(msg, ex);
        } finally {
            if (oConnection != null) {
                oConnection.close();
            }
            if (oConnectionImplementation != null) {
                oConnectionImplementation.disposeConnection();
            }
        }
    }

    @Override
    public String update() throws Exception {
        HttpSession oSession = oRequest.getSession();
        ResponseBean oResponseBean;
        Gson oGson = GsonFactory.getGson();
        if (oSession.getAttribute("usuario") != null) {
            ConnectionInterface oConnectionImplementation = null;
            Connection oConnection = null;
            try {
                oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
                oConnection = oConnectionImplementation.newConnection();
                ProductoBean oProductoBean = new ProductoBean();
                String data = oRequest.getParameter("data");
                oProductoBean = oGson.fromJson(data, ProductoBean.class);
                ProductoDao oProductoDao = new ProductoDao(oConnection);
                if (oProductoDao.update(oProductoBean) == 0) {
                    oResponseBean = new ResponseBean(500, "KO");
                } else {
                    oResponseBean = new ResponseBean(200, "OK");
                }
                return oGson.toJson(oResponseBean);
            } catch (Exception ex) {
                String msg = this.getClass().getName() + " get method ";
                throw new Exception(msg, ex);
            } finally {
                if (oConnection != null) {
                    oConnection.close();
                }
                if (oConnectionImplementation != null) {
                    oConnectionImplementation.disposeConnection();
                }
            }
        } else {
            oResponseBean = new ResponseBean(401, "Error: No session");
            return oGson.toJson(oResponseBean);
        }

    }

    @Override
    public String insert() throws Exception {
        HttpSession oSession = oRequest.getSession();
        ResponseBean oResponseBean;
        Gson oGson = GsonFactory.getGson();
        if (oSession.getAttribute("usuario") != null) {
            ConnectionInterface oConnectionImplementation = null;
            Connection oConnection = null;
            try {
                oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
                oConnection = oConnectionImplementation.newConnection();
                final GsonBuilder builder = new GsonBuilder();
                builder.excludeFieldsWithoutExposeAnnotation();
                ProductoBean oProductoBean = oGson.fromJson(oRequest.getParameter("data"), ProductoBean.class);
                ProductoDao oProductoDao = new ProductoDao(oConnection);
                if (oProductoDao.insert(oProductoBean) == 0) {
                    oResponseBean = new ResponseBean(500, "KO");
                } else {
                    oResponseBean = new ResponseBean(200, "OK");
                };
                return oGson.toJson(oResponseBean);
            } catch (Exception ex) {
                String msg = this.getClass().getName() + " get method ";
                throw new Exception(msg, ex);
            } finally {
                if (oConnection != null) {
                    oConnection.close();
                }
                if (oConnectionImplementation != null) {
                    oConnectionImplementation.disposeConnection();
                }
            }
        } else {
            oResponseBean = new ResponseBean(401, "Error: No session");
            return oGson.toJson(oResponseBean);
        }
    }

    @Override
    public String remove() throws Exception {
        HttpSession oSession = oRequest.getSession();
        ResponseBean oResponseBean;
        Gson oGson = GsonFactory.getGson();
        if (oSession.getAttribute("usuario") != null) {
            ConnectionInterface oConnectionImplementation = null;
            Connection oConnection = null;
            try {
                oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
                oConnection = oConnectionImplementation.newConnection();
                ProductoDao oProductoDao = new ProductoDao(oConnection);
                int id = Integer.parseInt(oRequest.getParameter("id"));
                if (oProductoDao.remove(id) == 0) {
                    oResponseBean = new ResponseBean(500, "KO");
                } else {
                    oResponseBean = new ResponseBean(200, "OK");
                }
                return oGson.toJson(oResponseBean);
            } catch (Exception ex) {
                String msg = this.getClass().getName() + " get method ";
                throw new Exception(msg, ex);
            } finally {
                if (oConnection != null) {
                    oConnection.close();
                }
                if (oConnectionImplementation != null) {
                    oConnectionImplementation.disposeConnection();
                }
            }
        } else {
            oResponseBean = new ResponseBean(401, "Error: No session");
            return oGson.toJson(oResponseBean);
        }
    }


    public String fill() throws Exception {
       ConnectionInterface oConnectionImplementation = ConnectionFactory
                .getConnection(ConnectionSettings.connectionPool);
        Connection oConnection = oConnectionImplementation.newConnection();
        ResponseBean oResponseBean;
        Gson oGson = GsonFactory.getGson();

        ProductoDao oProductoDao = new ProductoDao(oConnection);
        ProductoBean oProductoBean = new ProductoBean();
        Integer number = Integer.parseInt(oRequest.getParameter("number"));
        for (int i = 0; i < number; i++) {
            String codigo = codigoRandom();
            int existencias = existenciasRandom();
            float precio = precioRandom();
            int tipoProducto = tipoProductoRandom();
            String descripcion = productoRandom();
            oProductoBean.setCodigo(codigo);
            oProductoBean.setExistencias(existencias);
            oProductoBean.setPrecio(precio);
            oProductoBean.setImagen("imagenrandom");
            oProductoBean.setDescripcion(descripcion);
            oProductoBean.setTipo_producto_id(tipoProducto);
            oProductoDao.insert(oProductoBean);
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
    
      private String productoRandom() {
        String[] p1 = {"Maquina de ", "Panatalon de ", "Procesdor de ",
            "Vaso de ", "Piscina de ", "Puerta de ", "Pendrive de ",
            "Nevera de ", "Botella de ", "Ordenador de ", "Zapatilla de "};
        String[] p2 = {"tubos de escape", "papel higienico", "hacer velas",
            "pepinos", "mortadelos", "coches electricos", "plastico",
            "hacer deporte", "fuertaco", "oro", "pisapapel"};
        String productoRandom = "";

            productoRandom += p1[(int) (Math.random() * p1.length) + 0];
            productoRandom += p2[(int) (Math.random() * p2.length) + 0];

        return productoRandom;
    }
      
    private float precioRandom() { 
      return (float) (Math.random() * (0 - 3000 + 1) + 3000); 
    }  
    
    private int existenciasRandom() {
        return (int) (Math.random() * (0 - 1000 + 1) + 1000);
    }
    private String codigoRandom() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 10) {
            int index = (int) (rnd.nextFloat() * chars.length());
            salt.append(chars.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }
    
    private int tipoProductoRandom() {
        return (int) (Math.random() * (1 - 12 + 1) + 12);
    }
    
}
