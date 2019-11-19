package net.ausiasmarch.service;

import com.google.gson.Gson;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import net.ausiasmarch.bean.ItemBean;
import net.ausiasmarch.bean.ProductoBean;
import net.ausiasmarch.bean.ResponseBean;
import net.ausiasmarch.connection.ConnectionInterface;
import net.ausiasmarch.dao.ProductoDao;
import net.ausiasmarch.factory.ConnectionFactory;
import net.ausiasmarch.factory.GsonFactory;
import net.ausiasmarch.setting.ConnectionSettings;

public class CarritoService {

// API
//json?ob=carrito&op=add&id=??&cantidad=??
//json?ob=carrito&op=remove&id=??&cantidad=??
//json?ob=carrito&op=list
//json?ob=carrito&op=empty
//json?ob=carrito&op=buy
    HttpServletRequest oRequest = null;

    public CarritoService(HttpServletRequest oRequest) {
        this.oRequest = oRequest;
   
    }

    public String add() throws Exception {
        @SuppressWarnings("unchecked")
        ItemBean oItemBean = null;
        int id = Integer.parseInt(oRequest.getParameter("id"));
        int cantidad = Integer.parseInt(oRequest.getParameter("cantidad"));
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        ProductoDao oProductoDao = null; 
        Gson oGson = GsonFactory.getGson();
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            ProductoBean oProductoBean = new ProductoBean(id);
            oProductoDao = new ProductoDao(oConnection);
            oProductoBean = (ProductoBean) oProductoDao.get(id);
            oItemBean = new ItemBean(cantidad, oProductoBean);
            HttpSession oSession = oRequest.getSession();
            ArrayList<ItemBean> alCarrito = (ArrayList<ItemBean>) oSession.getAttribute("carrito");
            if (alCarrito == null) {
                alCarrito = new ArrayList<ItemBean>();
            }
            oItemBean = find(alCarrito, oItemBean.getProducto_obj().getId());    
           //Comprueba si encuentra el producto, si no lo encuentra lo añade a la lista, si lo encuentra lo suma.
            if (oItemBean == null) {
                    oItemBean = new ItemBean(cantidad, oProductoBean);
                    alCarrito.add(oItemBean);
                } else {
                    Integer oldCantidad = oItemBean.getCantidad();
                    oItemBean.setCantidad(oldCantidad + cantidad);
                }

            oRequest.getSession().setAttribute("carrito", alCarrito);
            return oGson.toJson(new ResponseBean(200, "OK"));
         } catch (Exception ex) {
                String msg = this.getClass().getName() + ":" + (ex.getStackTrace()[0]).getMethodName();
                oConnection.rollback();
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

    public String remove() throws Exception {
        ItemBean oItemBean = null;
        int id = Integer.parseInt(oRequest.getParameter("id"));
        int cantidad = Integer.parseInt(oRequest.getParameter("cantidad"));
        ConnectionInterface oConnectionImplementation = null;
        Connection oConnection = null;
        ProductoDao oProductoDao = null; 
        Gson oGson = GsonFactory.getGson();
        try {
            oConnectionImplementation = ConnectionFactory.getConnection(ConnectionSettings.connectionPool);
            oConnection = oConnectionImplementation.newConnection();
            ProductoBean oProductoBean = new ProductoBean(id);
            oProductoDao = new ProductoDao(oConnection);
            oProductoBean = (ProductoBean) oProductoDao.get(id);
            oItemBean = new ItemBean(cantidad, oProductoBean);
             HttpSession oSession = oRequest.getSession();
            ArrayList<ItemBean> alCarrito = (ArrayList<ItemBean>) oSession.getAttribute("carrito");
            if (alCarrito == null) {
                return oGson.toJson(new ResponseBean(200, "OK"));
            }
            int resultadoFind = this.findRemove(alCarrito, id);
            if (resultadoFind >= 0) {
                oItemBean = alCarrito.get(resultadoFind);
                oItemBean.setCantidad(oItemBean.getCantidad() - cantidad);
                if (oItemBean.getCantidad() > 0) {
                    alCarrito.set(resultadoFind, oItemBean);
                } else {
                    alCarrito.remove(resultadoFind);
                }
            } else {
                alCarrito.add(new ItemBean(id, cantidad));
            }
            oSession.setAttribute("carrito", alCarrito);
            return oGson.toJson(new ResponseBean(200, "OK"));
         } catch (Exception ex) {
                String msg = this.getClass().getName() + ":" + (ex.getStackTrace()[0]).getMethodName();
                oConnection.rollback();
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

    public String list() throws Exception {
        Gson oGson = GsonFactory.getGson();
        try {
            HttpSession oSession = oRequest.getSession();
            @SuppressWarnings("unchecked")
            ArrayList<ItemBean> alCarrito = (ArrayList<ItemBean>) oSession.getAttribute("carrito");
            return "{\"status\":200,\"message\":" + oGson.toJson(alCarrito) + "}";
        } catch (Exception ex) {
        
            return oGson.toJson(new ResponseBean(500, ex.getMessage()));
        }
    }

    public String empty() throws Exception {
        Gson oGson = GsonFactory.getGson();
        try {
            HttpSession oSession = oRequest.getSession();
            oSession.setAttribute("carrito", null);
            return oGson.toJson(new ResponseBean(200, "OK"));
        } catch (Exception ex) {
            return oGson.toJson(new ResponseBean(500, ex.getMessage()));
        }
    }
  
     private ItemBean find(ArrayList<ItemBean> alCarrito, int id) {
         
        for (int i = 0; i < alCarrito.size(); i++) {
            ItemBean oItemBean = alCarrito.get(i);
            if (id == (oItemBean.getProducto_obj().getId())) {
                return oItemBean;
            }
        }
        return null;
    }
     
     private int findRemove(ArrayList<ItemBean> alCarrito, int id) {
        for (int i = 0; i < alCarrito.size(); i++) {
            ItemBean oItemBean = alCarrito.get(i);
            if (oItemBean.getProducto_obj().getId() == id) {
                return i;
            }
        }
        return -1;
    }
    

}
